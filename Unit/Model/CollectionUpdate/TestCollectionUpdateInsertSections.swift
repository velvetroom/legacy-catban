import XCTest
@testable import catban

class TestCollectionUpdateInsertSections:XCTestCase {
    private var update:CollectionUpdateInsertSections!
    private var view:MockLandingViewCollection!
    private var project:MockProjectProtocol!
    private var column:ProjectColumn!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let sections:IndexSet = IndexSet(integer:456765)
    }
    
    override func setUp() {
        super.setUp()
        self.update = CollectionUpdateInsertSections()
        self.view = MockLandingViewCollection()
        self.project = MockProjectProtocol()
        self.column = ProjectColumn()
        self.update.sections = Constants.sections
        self.update.column = self.column
    }
    
    func testLoad() {
        XCTAssertNotNil(self.update, "Failed to load update")
        XCTAssertNotNil(self.update.sections, "Failed top load sections")
        XCTAssertNotNil(self.update.column, "Failed to load column")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testStrategyCollection() {
        self.startExpectation()
        self.view.onInsertSections = { [weak self] (sections:IndexSet) in
            XCTAssertEqual(sections, Constants.sections, "Invalid sections")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(collectionView:self.view)
        
        self.waitExpectation()
    }
    
    func testStrategyProject() {
        self.startExpectation()
        self.project.onInsertColumnAt = { [weak self] (column:ProjectColumn, index:Int) in
            XCTAssertTrue(column === self?.column, "Invalid column")
            XCTAssertEqual(index, Constants.sections.first, "Invalid index")
            self?.expect?.fulfill()
        }
        
        self.update.strategy(project:self.project)
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
