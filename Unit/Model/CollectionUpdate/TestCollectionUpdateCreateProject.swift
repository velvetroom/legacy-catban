import XCTest
@testable import catban

class TestCollectionUpdateCreateProject:XCTestCase {
    private var update:CollectionUpdateCreateProject!
    private var view:MockLandingViewCollection!
    private var board:MockBoardProtocol!
    private var project:MockProjectProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.update = CollectionUpdateCreateProject()
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
        XCTAssertNotNil(self.update.project, "Failed to load project")
        XCTAssertNotNil(self.update.removeIndexSet, "Failed to load remove index set")
        XCTAssertFalse(self.update.project.identifier.isEmpty, "Failed to assign identifier")
        XCTAssertFalse(self.update.project.name.isEmpty, "Failed to assign name")
        XCTAssertTrue(self.update.removeIndexSet.isEmpty, "Indexset should be empty")
    }
    
    func testStrategyCollection() {
        self.project.columns.append(ProjectColumn())
        self.project.columns.append(ProjectColumn())
        self.project.columns.append(ProjectColumn())
        self.startExpectation()
        self.view.onDeleteSections = { [weak self] (indexSet:IndexSet) in
            XCTAssertEqual(self?.project.columns.count, indexSet.count, "Invalid number of sections")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(board:self.board)
        self.update.strategy(collectionView:self.view)
        
        self.waitExpectation()
    }
    
    func testStrategyBoardInsertsProject() {
        self.startExpectation()
        self.board.onInserProject = { [weak self] (project:ProjectProtocol) in
            XCTAssertEqual(project.identifier, self?.update.project.identifier,
                           "Invalid project received")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(board:self.board)
        
        self.waitExpectation()
    }
    
    func testStrategyBoardUpdatesProject() {
        self.update.strategy(board:self.board)
        XCTAssertEqual(self.board.project.identifier, self.update.project.identifier,
                       "Failed to update current project")
    }
    
    func testStrategyBoardUpdatesIndexset() {
        self.project.columns.append(ProjectColumn())
        self.project.columns.append(ProjectColumn())
        self.project.columns.append(ProjectColumn())
        self.update.strategy(board:self.board)
        XCTAssertEqual(self.update.removeIndexSet.count, self.project.columns.count,
                       "Failed to update remove indexset")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
