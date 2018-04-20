import XCTest
@testable import catban

class TestOrganiseController:XCTestCase {
    private var controller:OrganiseController<MockOrganiseProtocol>!
    private var outlets:OrganisePresenterOutlets {
        get {
            return self.controller.model.presenter.outlets
        }
    }
    
    override func setUp() {
        super.setUp()
        self.controller = OrganiseController<MockOrganiseProtocol>()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        XCTAssertNotNil(self.outlets.collection, "Failed to load collection")
        XCTAssertNotNil(self.outlets.collection?.delegate, "Failed to assign delegate")
        XCTAssertNotNil(self.outlets.collection?.dataSource, "Failed to assign datasource")
    }
}
