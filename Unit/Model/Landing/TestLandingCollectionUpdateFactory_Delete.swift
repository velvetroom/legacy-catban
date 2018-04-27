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
        self.addColumn()
        var updates:[UpdateProtocol] = []
        XCTAssertNoThrow(try updates = self.factory.deleteColumnAt(index:0, in:self.project))
        XCTAssertEqual(updates.count, 1, "There should be exactly 1 update")
    }
    
    func testDeleteColumnReturnsDeleteColumnUpdate() {
        self.addColumn()
        self.addColumn()
        var updates:[UpdateProtocol] = []
        XCTAssertNoThrow(try updates = self.factory.deleteColumnAt(index:0, in:self.project))
        let first:UpdateDeleteSections? = updates.first as? UpdateDeleteSections
        XCTAssertNotNil(first, "Returned update is not a type delete sections")
    }
    
    func testDeleteColumnForFirstColumnReturnsFirstColumn() {
        self.addColumn()
        self.addColumn()
        var updates:[UpdateProtocol] = []
        XCTAssertNoThrow(try updates = self.factory.deleteColumnAt(index:0, in:self.project))
        let update:UpdateDeleteSections = updates.first as! UpdateDeleteSections
        XCTAssertEqual(update.index, 0, "Invalid column returned")
    }
    
    func testDeleteColumnForThirdColumnReturnsThirdColumn() {
        self.addColumn()
        self.addColumn()
        self.addColumn()
        var updates:[UpdateProtocol] = []
        XCTAssertNoThrow(try updates = self.factory.deleteColumnAt(index:3, in:self.project))
        let update:UpdateDeleteSections = updates.first as! UpdateDeleteSections
        XCTAssertEqual(update.index, 3, "Invalid column returned")
    }
    
    private func addColumn() {
        self.project.columns.append(ProjectColumn())
    }
}
