import XCTest
@testable import catban

class TestUpdateOpenProject:XCTestCase {
    private var update:UpdateOpenProject!
    private var view:MockLandingViewCollection!
    private var board:MockBoardProtocol!
    private var project:MockProjectProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.update = UpdateOpenProject()
        self.view = MockLandingViewCollection()
        self.board = MockBoardProtocol()
        self.project = MockProjectProtocol()
        self.board.projects.append(Project())
        self.board.projects.append(self.project)
        self.project.columns.append(ProjectColumn())
        self.project.columns.append(ProjectColumn())
        self.project.columns.append(ProjectColumn())
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.update.indexSet, "Failed to load index set")
        XCTAssertTrue(self.update.indexSet.isEmpty, "Indexset should be empty")
    }
    
    func testStrategyCollectionInsertsSections() {
        self.startExpectation()
        self.view.onInsertSections = { [weak self] (indexSet:IndexSet) in
            XCTAssertEqual(self?.update.indexSet, indexSet, "Invalid insert indexSet")
            self?.expect?.fulfill()
        }
        
        self.update.updateIndexWith(project:self.project)
        self.update.strategy(collectionView:self.view)
        
        self.waitExpectation()
    }
    
    func testStrategyBoardUpdatesIndexset() {
        self.update.updateIndexWith(project:self.project)
        XCTAssertEqual(self.update.indexSet.count, self.project.columns.count, "Failed to update insert indexset")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
