import XCTest
@testable import catban

class TestUpdateFactory_CreateProject:XCTestCase {
    private var factory:UpdateFactory!
    private struct Constants {
        static let expectedUpdates:Int = 3
    }
    
    override func setUp() {
        super.setUp()
        self.factory = UpdateFactory()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.factory, "Failed to load factory")
    }
    
    func testReturnsThreeUpdates() {
        let updates:[UpdateProtocol] = self.factory.createProject()
        XCTAssertEqual(updates.count, Constants.expectedUpdates, "Invalid number of updates returned")
    }
    
    func testReturnsUpdateCreateProject() {
        let updates:[UpdateProtocol] = self.factory.createProject()
        let update:UpdateCreateProject = updates[2] as! UpdateCreateProject
        XCTAssertNotNil(update, "Invalid update received")
    }
    
    func testReturnsUpdateClose() {
        let updates:[UpdateProtocol] = self.factory.createProject()
        let update:UpdateCloseProject = updates[0] as! UpdateCloseProject
        XCTAssertNotNil(update, "Invalid update received")
    }
    
    func testReturnsUpdateOpen() {
        let updates:[UpdateProtocol] = self.factory.createProject()
        let update:UpdateOpenProject = updates[1] as! UpdateOpenProject
        XCTAssertNotNil(update, "Invalid update received")
        XCTAssertFalse(update.indexSet.isEmpty, "Failed to update indexset")
    }
}
