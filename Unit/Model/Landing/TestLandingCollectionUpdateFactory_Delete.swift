import XCTest
@testable import catban

class TestLandingCollectionUpdateFactory_Delete:XCTestCase {
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
    
    func testDeleteColumnReturnsOneUpdate() {
        self.addColumn()
        let updates:[CollectionUpdateProtocol] = self.factory.deleteColumnAt(index:0)
        XCTAssertEqual(updates.count, 1, "There should be exactly 1 update")
    }
    
    func testDeleteColumnReturnsDeleteColumnUpdate() {
        self.addColumn()
        let updates:[CollectionUpdateProtocol] = self.factory.deleteColumnAt(index:0)
        XCTAssertEqual(updates.count, 1, "There should be exactly 1 update")
    }
    
    private func addColumn() {
        self.project.columns.append(ProjectColumn())
    }
}
