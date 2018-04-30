import XCTest
@testable import catban

class TestErrorController:XCTestCase {
    private var controller:ErrorController!
    private struct Constants {
        static let message:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.controller = ErrorController()
        self.controller.model.message = Constants.message
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
    
    func testUpdateAlertMessage() {
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        XCTAssertEqual(self.controller.message, Constants.message, "Failed to update message")
    }
}
