import XCTest
@testable import catban

class TestUpdateDeleteCard:XCTestCase {
    private var update:UpdateDeleteCard!
    private var view:MockLandingViewCollection!
    private var board:MockBoardProtocol!
    private var project:MockProjectProtocol!
    private var history:MockHistoryProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let indexPath:IndexPath = IndexPath(item:11, section:0)
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.update = UpdateDeleteCard()
        self.view = MockLandingViewCollection()
        self.board = MockBoardProtocol()
        self.project = MockProjectProtocol()
        self.history = MockHistoryProtocol()
        self.board.project = self.project
        self.project.history = self.history
        self.update.index = Constants.indexPath
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.history, "Failed to load history")
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testStrategyCollection() {
        self.startExpectation()
        self.view.onDeleteItemAtIndex = { [weak self] (indexes:[IndexPath]) in
            XCTAssertEqual(indexes.first, Constants.indexPath, "Invalid index")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(collectionView:self.view)
        self.waitExpectation()
    }
    
    func testStrategyCollectionClearsSelection() {
        self.startExpectation()
        self.view.onSelectItemAtIndex = { [weak self] (indexPath:IndexPath?) in
            XCTAssertNil(indexPath, "Failed to clear selection")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(collectionView:self.view)
        self.waitExpectation()
    }
    
    func testStrategyBoardInsertCard() {
        self.startExpectation()
        self.project.onDeleteCardAt = { [weak self] (index:IndexPath) in
            XCTAssertEqual(index, Constants.indexPath, "Invalid index")
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
