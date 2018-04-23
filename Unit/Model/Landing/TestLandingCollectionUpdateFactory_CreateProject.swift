import XCTest
@testable import catban

class TestLandingCollectionUpdateFactory_CreateProject:XCTestCase {
    private var factory:LandingCollectionUpdateFactory!
    private struct Constants {
        static let expectedUpdates:Int = 3
    }
    
    override func setUp() {
        super.setUp()
        self.factory = LandingCollectionUpdateFactory()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.factory, "Failed to load factory")
    }
    
    func testReturnsOneUpdate() {
        let updates:[CollectionUpdateProtocol] = self.factory.createProject()
        XCTAssertEqual(updates.count, Constants.expectedUpdates, "Invalid number of updates returned")
    }
    
    func testReturnsUpdateCreateProject() {
        let updates:[CollectionUpdateProtocol] = self.factory.createProject()
        let update:CollectionUpdateCreateProject = updates[2] as! CollectionUpdateCreateProject
        XCTAssertNotNil(update, "Invalid update received")
    }
    
    func testReturnsUpdateClose() {
        let updates:[CollectionUpdateProtocol] = self.factory.createProject()
        let update:CollectionUpdateCloseProject = updates[0] as! CollectionUpdateCloseProject
        XCTAssertNotNil(update, "Invalid update received")
    }
    
    func testReturnsUpdateOpen() {
        let updates:[CollectionUpdateProtocol] = self.factory.createProject()
        let update:CollectionUpdateOpenProject = updates[1] as! CollectionUpdateOpenProject
        XCTAssertNotNil(update, "Invalid update received")
        XCTAssertFalse(update.indexSet.isEmpty, "Failed to update indexset")
    }
}
