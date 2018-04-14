import XCTest
@testable import catban

class TestErrorController:XCTestCase {
    private var controller:ErrorController!
    
    override func setUp() {
        super.setUp()
        self.controller = ErrorController()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.model, "Failed to load model")
    }
    
    func testViewDidLoad() {
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        XCTAssertGreaterThan(self.controller.actions.count, 0, "Not loading actions on view did load")
        XCTAssertNotNil(self.controller.model.presenter.actionCancel, "Failed to load cancel")
    }
    
    func testPreferredStyle() {
        XCTAssertEqual(self.controller.preferredStyle, UIAlertControllerStyle.alert,
                       "Invalid style")
    }
}
