import XCTest
@testable import catban

class TestLanding_DeleteCardUpdate:XCTestCase {
    private var model:Landing!
    private var board:MockBoardProtocol!
    private var project:MockProjectProtocol!
    private var update:MockUpdateFactoryProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let indexPath:IndexPath = IndexPath(item:11, section:22)
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.board = MockBoardProtocol()
        self.project = MockProjectProtocol()
        self.update = MockUpdateFactoryProtocol()
        self.model.board = self.board
        self.model.project = self.project
        self.model.update = self.update
        self.model.project.columns.append(ProjectColumn())
        self.model.editingCard = Constants.indexPath
    }
    
    func testLoad() {
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testGetUpdates() {
        self.startExpectation()
        self.update.onDeleteCardAtIndex = { [weak self] (index:IndexPath) in
            XCTAssertEqual(index, Constants.indexPath, "Invalid index received")
            self?.expect?.fulfill()
        }
        
        self.model.deleteCard()
        self.waitExpectations()
    }
    
    func testClearsEditingCard() {
        XCTAssertNotNil(self.model.editingCard, "Should be editing at the beginning")
        self.model.deleteCard()
        XCTAssertNil(self.model.editingCard, "Failed to clear editing")
    }
    
    func testLeftApplyUpdatesOnBoard() {
        self.startExpectation()
        self.board.onApplyUpdates = { [weak self] (updates:[UpdateProtocol]) in
            self?.expect?.fulfill()
        }
        
        self.model.deleteCard()
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
