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
        let updates:[CollectionUpdateProtocol] = self.factory.deleteColumnAt(index:0, in:self.project)
        XCTAssertEqual(updates.count, 1, "There should be exactly 1 update")
    }
    
    func testDeleteColumnReturnsDeleteColumnUpdate() {
        self.addColumn()
        let updates:[CollectionUpdateProtocol] = self.factory.deleteColumnAt(index:0, in:self.project)
        let first:CollectionUpdateDeleteSections? = updates.first as? CollectionUpdateDeleteSections
        XCTAssertNotNil(first, "Returned update is not a type delete sections")
    }
    
    func testDeleteColumnReturnsOneIndex() {
        self.addColumn()
        let updates:[CollectionUpdateProtocol] = self.factory.deleteColumnAt(index:0, in:self.project)
        let update:CollectionUpdateDeleteSections = updates.first as! CollectionUpdateDeleteSections
        XCTAssertEqual(update.indexes.count, 1, "There should be exaxctly 1 index in the set")
    }
    
    func testDeleteColumnForFirstColumnReturnsFirstColumn() {
        self.addColumn()
        let updates:[CollectionUpdateProtocol] = self.factory.deleteColumnAt(index:0, in:self.project)
        let update:CollectionUpdateDeleteSections = updates.first as! CollectionUpdateDeleteSections
        XCTAssertEqual(update.indexes.first!, 0, "Invalid column returned")
    }
    
    func testDeleteColumnForThirdColumnReturnsThirdColumn() {
        self.addColumn()
        self.addColumn()
        self.addColumn()
        let updates:[CollectionUpdateProtocol] = self.factory.deleteColumnAt(index:3, in:self.project)
        let update:CollectionUpdateDeleteSections = updates.first as! CollectionUpdateDeleteSections
        XCTAssertEqual(update.indexes.first!, 3, "Invalid column returned")
    }
    
    private func addColumn() {
        self.project.columns.append(ProjectColumn())
    }
}