import XCTest
@testable import catban

class TestLandingCollectionUpdateFactory_Delete_Exceptions:XCTestCase {
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
    
    func testShouldThrowWhenEmptyProject() {
        XCTAssertThrowsError(try self.factory.deleteColumnAt(index:0, in:self.project),
                             "Failed to throw when project is empty")
    }
    
    func testShouldThrowWhenOnlyOneColumn() {
        self.project.columns.append(ProjectColumn())
        XCTAssertThrowsError(try self.factory.deleteColumnAt(index:0, in:self.project),
                             "Failed to throw when only one column")
    }
    
    func testShouldNotThrowWhenMoreThanOneColumn() {
        self.project.columns.append(ProjectColumn())
        self.project.columns.append(ProjectColumn())
        XCTAssertNoThrow(try self.factory.deleteColumnAt(index:0, in:self.project),
                         "Should not throw")
    }
}
