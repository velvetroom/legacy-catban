import XCTest
@testable import catban

class TestLanding_CardsMoveUpdate:XCTestCase {
    private var model:Landing!
    private var board:MockBoardProtocol!
    private var project:MockProjectProtocol!
    private var update:MockUpdateFactoryProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let origin:IndexPath = IndexPath(item:11, section:22)
        static let destination:IndexPath = IndexPath(item:22, section:11)
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.board = MockBoardProtocol()
        self.project = MockProjectProtocol()
        self.update = MockUpdateFactoryProtocol()
        self.model.board = self.board
        self.board.project = self.project
        self.model.update = self.update
        self.model.project.columns.append(ProjectColumn())
        self.model.editingCard = Constants.origin
        self.project.indexForCard = Constants.destination
    }
    
    func testLoad() {
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testMovingLeftGetUpdates() {
        self.startExpectation()
        self.update.onMoveCardFrom = { [weak self] (origin:IndexPath, destination:IndexPath) in
            XCTAssertEqual(origin, Constants.origin, "Invalid origin received")
            XCTAssertEqual(destination, Constants.destination, "Invalid destination received")
            self?.expect?.fulfill()
        }
        
        self.model.moveCardFrom(origin:Constants.origin, to:Constants.destination)
        self.waitExpectations()
    }
    
    func testMovingRightGetUpdates() {
        self.startExpectation()
        self.update.onMoveCardFrom = { [weak self] (origin:IndexPath, destination:IndexPath) in
            XCTAssertEqual(origin, Constants.origin, "Invalid origin received")
            XCTAssertEqual(destination, Constants.destination, "Invalid destination received")
            self?.expect?.fulfill()
        }
        
        self.model.moveCardFrom(origin:Constants.origin, to:Constants.destination)
        self.waitExpectations()
    }
    
    func testLeftApplyUpdatesOnBoard() {
        self.startExpectation()
        self.board.onApplyUpdates = { [weak self] (updates:[UpdateProtocol]) in
            self?.expect?.fulfill()
        }
        
        self.model.moveCardFrom(origin:Constants.origin, to:Constants.destination)
        self.waitExpectations()
    }
    
    func testRightApplyUpdatesOnBoard() {
        self.startExpectation()
        self.board.onApplyUpdates = { [weak self] (updates:[UpdateProtocol]) in
            self?.expect?.fulfill()
        }
        
        self.model.moveCardFrom(origin:Constants.origin, to:Constants.destination)
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
