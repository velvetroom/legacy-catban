import XCTest
@testable import catban

class TestLandingCollectionUpdateFactory_SalvageItemsFromDeletion_Exceptions:XCTestCase {
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
    
    func testShouldThrowWhenEmptyProject() {
        XCTAssertThrowsError(try self.factory.salvageItemsFromColumn(index:0, in:self.project),
                             "Failed to throw when project is empty")
    }
    
    func testShouldThrowWhenOnlyOneColumn() {
        self.project.columns.append(ProjectColumn())
        XCTAssertThrowsError(try self.factory.salvageItemsFromColumn(index:0, in:self.project),
                             "Failed to throw when only one column")
    }
    
    func testShouldNotThrowWhenMoreThanOneColumn() {
        self.project.columns.append(ProjectColumn())
        self.project.columns.append(ProjectColumn())
        XCTAssertNoThrow(try self.factory.salvageItemsFromColumn(index:0, in:self.project),
                             "Should not throw")
    }
}
