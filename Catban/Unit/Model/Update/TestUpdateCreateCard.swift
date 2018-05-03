import XCTest
@testable import catban

class TestUpdateCreateCard:XCTestCase {
    private var update:UpdateCreateCard!
    private var view:MockLandingViewCollection!
    private var board:MockBoardProtocol!
    private var project:MockProjectProtocol!
    private var history:MockHistoryProtocol!
    private var card:ProjectCard!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let indexPath:IndexPath = IndexPath(item:11, section:0)
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.update = UpdateCreateCard()
        self.view = MockLandingViewCollection()
        self.board = MockBoardProtocol()
        self.project = MockProjectProtocol()
        self.history = MockHistoryProtocol()
        self.board.project = self.project
        self.project.history = self.history
        self.card = self.update.card
        self.update.indexPath = Constants.indexPath
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.update.card, "Failed top load card")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.history, "Failed to load history")
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testIdentifier() {
        XCTAssertFalse(self.card.identifier.isEmpty, "Failed to create identifier for card")
    }
    
    func testStrategyCollection() {
        self.startExpectation()
        self.view.onInsertItemAtIndex = { [weak self] (indexes:[IndexPath]) in
            let index:IndexPath = indexes.first!
            XCTAssertEqual(index, Constants.indexPath, "Invalid indexpath")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(collectionView:self.view)
        self.waitExpectation()
    }
    
    func testStrategyBoardAddsToHistory() {
        self.startExpectation()
        self.history.onCreatedCard = { [weak self] (card:ProjectCard) in
            XCTAssertTrue(card === self?.card, "Invalid card received")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(board:self.board)
        self.waitExpectation()
    }
    
    func testStrategyBoardInsertCard() {
        self.startExpectation()
        self.project.onInsertCardAt = { [weak self] (card:ProjectCard, index:IndexPath) in
            XCTAssertEqual(index, Constants.indexPath, "Invalid indexpath")
            XCTAssertTrue(card === self?.card, "Invalid card received")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(board:self.board)
        self.waitExpectation()
    }
    
    func testStrategyBoardSavesProject() {
        self.startExpectation()
        self.board.onSaveProject = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.update.strategy(board:self.board)
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
