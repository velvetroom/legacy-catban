import XCTest
@testable import catban

class TestLandingCollectionUpdateFactory_Insert:XCTestCase {
    private var factory:LandingCollectionUpdateFactory!
    private var project:Project!
    
    override func setUp() {
        super.setUp()
        self.factory = LandingCollectionUpdateFactory()
        self.project = Project()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.factory, "Failed to load factory")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testInsertColumnsReturnsOneUpdate() {
        let updates:[CollectionUpdateProtocol] = self.factory.insertColumnIn(project:self.project)
        XCTAssertEqual(updates.count, 1, "There should be exactly 1 update")
    }
    
    func testInsertColumnsReturnsInsertSectionsUpdate() {
        let updates:[CollectionUpdateProtocol] = self.factory.insertColumnIn(project:self.project)
        let first:CollectionUpdateInsertSections? = updates.first as? CollectionUpdateInsertSections
        XCTAssertNotNil(first, "Returned update is not a type insert sections")
    }
    
    func testInsertColumnsOnEmptyProject() {
        let updates:[CollectionUpdateProtocol] = self.factory.insertColumnIn(project:self.project)
        let first:CollectionUpdateInsertSections = updates.first as! CollectionUpdateInsertSections
        XCTAssertEqual(first.section, 0, "Invalid index for new section")
    }
    
    func testInsertColumnsOnNonEmptyProject() {
        self.project.columns.append(ProjectColumn())
        self.project.columns.append(ProjectColumn())
        let updates:[CollectionUpdateProtocol] = self.factory.insertColumnIn(project:self.project)
        let first:CollectionUpdateInsertSections = updates.first as! CollectionUpdateInsertSections
        XCTAssertEqual(first.section, 2, "Invalid index for new section")
    }
}
