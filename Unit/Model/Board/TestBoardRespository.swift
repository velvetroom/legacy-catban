import XCTest
@testable import catban

class TestBoardRespository:XCTestCase {
    private var model:BoardRepository!
    private var board:Board!
    private var repository:MockRepositoryProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = BoardRepository()
        self.repository = MockRepositoryProtocol()
        self.board = Board()
        self.model.repository = self.repository
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.repository, "Failed to load repository")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.model.dispatchQueue, "Failed to load queue")
    }
    
    func testSaveCallsRepositoryLocalSave() {
        self.startExpectation()
        self.repository.onLocalSave = { [weak self] (board:BoardProtocol) in
            let board:Board = board as! Board
            XCTAssertFalse(Thread.isMainThread, "Should not be on main thread")
            XCTAssertTrue(board === self?.board, "Invalid board received")
            self?.expect?.fulfill()
        }
        
        self.model.save(board:self.board)
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
