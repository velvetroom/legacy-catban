import XCTest
@testable import catban

class TestUpdateFactory_Insert:XCTestCase {
    private var factory:UpdateFactory!
    private var project:Project!
    
    override func setUp() {
        super.setUp()
        self.factory = UpdateFactory()
        self.project = Project()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.factory, "Failed to load factory")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testInsertColumnsReturnsOneUpdate() {
        let updates:[UpdateProtocol] = self.factory.createColumnIn(project:self.project)
        XCTAssertEqual(updates.count, 1, "There should be exactly 1 update")
    }
    
    func testInsertColumnsReturnsInsertSectionsUpdate() {
        let updates:[UpdateProtocol] = self.factory.createColumnIn(project:self.project)
        let first:UpdateCreateColumn? = updates.first as? UpdateCreateColumn
        XCTAssertNotNil(first, "Returned update is not a type insert sections")
    }
    
    func testInsertColumnsOnEmptyProject() {
        let updates:[UpdateProtocol] = self.factory.createColumnIn(project:self.project)
        let first:UpdateCreateColumn = updates.first as! UpdateCreateColumn
        XCTAssertEqual(first.section, 0, "Invalid index for new section")
    }
    
    func testInsertColumnsOnNonEmptyProject() {
        self.project.columns.append(ProjectColumn())
        self.project.columns.append(ProjectColumn())
        let updates:[UpdateProtocol] = self.factory.createColumnIn(project:self.project)
        let first:UpdateCreateColumn = updates.first as! UpdateCreateColumn
        XCTAssertEqual(first.section, 2, "Invalid index for new section")
    }
}
