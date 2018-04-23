import XCTest
@testable import catban

class TestCollectionUpdateCloseProject:XCTestCase {
    private var update:CollectionUpdateCloseProject!
    private var view:MockLandingViewCollection!
    private var board:MockBoardProtocol!
    private var project:MockProjectProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.update = CollectionUpdateCloseProject()
        self.view = MockLandingViewCollection()
        self.board = MockBoardProtocol()
        self.project = MockProjectProtocol()
        self.board.project = self.project
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.update.indexSet, "Failed to load index set")
        XCTAssertTrue(self.update.indexSet.isEmpty, "Indexset should be empty")
    }
    
    func testStrategyCollectionDeletesSections() {
        self.project.columns.append(ProjectColumn())
        self.project.columns.append(ProjectColumn())
        self.project.columns.append(ProjectColumn())
        self.startExpectation()
        self.view.onDeleteSections = { [weak self] (indexSet:IndexSet) in
            XCTAssertEqual(self?.update.indexSet, indexSet, "Invalid remove indexSet")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(board:self.board)
        self.update.strategy(collectionView:self.view)
        
        self.waitExpectation()
    }
    
    func testStrategyBoardUpdatesIndexset() {
        self.project.columns.append(ProjectColumn())
        self.project.columns.append(ProjectColumn())
        self.project.columns.append(ProjectColumn())
        self.update.strategy(board:self.board)
        XCTAssertEqual(self.update.indexSet.count, self.project.columns.count, "Failed to update remove indexset")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
