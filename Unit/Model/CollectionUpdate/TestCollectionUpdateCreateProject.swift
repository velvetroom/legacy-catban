import XCTest
@testable import catban

class TestCollectionUpdateCreateProject:XCTestCase {
    private var update:CollectionUpdateCreateProject!
    private var view:MockLandingViewCollection!
    private var project:MockProjectProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.update = CollectionUpdateCreateProject()
        self.view = MockLandingViewCollection()
        self.project = MockProjectProtocol()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.update.project, "Failed to load project")
    }/*
    
    func testStrategyCollection() {
        self.startExpectation()
        self.view.onDeleteSections = { [weak self] (indexes:IndexSet) in
            XCTAssertEqual(indexes.first, Constants.index, "Invalid index set")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(collectionView:self.view)
        
        self.waitExpectation()
    }
    
    func testStrategyProject() {
        self.startExpectation()
        self.project.onDeleteColumnAt = { [weak self] (index:Int) in
            XCTAssertEqual(index, Constants.index, "Invalid index")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(project:self.project)
        
        self.waitExpectation()
    }*/
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
