import XCTest
@testable import catban

class TestLandingCollectionUpdateFactory_CreateProject:XCTestCase {
    private var factory:LandingCollectionUpdateFactory!
    
    override func setUp() {
        super.setUp()
        self.factory = LandingCollectionUpdateFactory()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.factory, "Failed to load factory")
    }
    
    func testReturnsOneUpdate() {
        let updates:[CollectionUpdateProtocol] = self.factory.createProject()
        XCTAssertEqual(updates.count, 1, "Invalid number of updates returned")
    }
    
    func testReturnsUpdateCreateProject() {
        let updates:[CollectionUpdateProtocol] = self.factory.createProject()
        let update:CollectionUpdateCreateProject = updates.first as! CollectionUpdateCreateProject
        XCTAssertNotNil(update, "Invalid update received")
    }
}
