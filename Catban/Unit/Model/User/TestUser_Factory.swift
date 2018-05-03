import XCTest
@testable import catban

class TestUser_Factory:XCTestCase {
    private var user:UserProtocol!
    
    override func setUp() {
        super.setUp()
        self.user = User.factoryNewUser()
    }
    
    func testIdentifier() {
        XCTAssertFalse(self.user.identifier.isEmpty, "Failed to assign identifier to new User")
    }
}
