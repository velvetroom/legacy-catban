import XCTest
@testable import catban

class TestOrganise:XCTestCase {
    private var model:Organise!
    private var presenter:MockOrganisePresenterProtocol!
    private var board:Board!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Organise()
        self.presenter = MockOrganisePresenterProtocol()
        self.board = Board()
        self.model.presenter = self.presenter
        self.model.board = self.board
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
    
    func testReloadViewModel() {
        self.startExpectation()
        self.presenter.onUpdateWithBoard = { [weak self] (board:BoardProtocol) in
            let board:Board = board as! Board
            XCTAssertNotNil(board, "Invalid board received")
            XCTAssertTrue(board === self?.board, "Invalid board received")
            self?.expect?.fulfill()
        }
        
        self.model.reloadViewModel()
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
