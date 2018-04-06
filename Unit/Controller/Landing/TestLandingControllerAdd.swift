import XCTest
@testable import catban

class TestLandingControllerAdd:XCTestCase {
    private var controller:LandingControllerAdd!
    private var model:LandingProtocol!
    private struct Constants {
        static let expectedActions:Int = 4
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingControllerAdd()
        self.model = MockLandingProtocol()
        self.controller.model = self.model
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNil(self.controller.delegate, "Delegate should not be set")
    }
    
    func testViewDidLoad() {
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        XCTAssertGreaterThan(self.controller.actions.count, 0, "Not loading actions on view did load")
    }
    
    func testPreferredStyle() {
        XCTAssertEqual(self.controller.preferredStyle, UIAlertControllerStyle.actionSheet, "Invalid style")
    }
    
    func testAddActions() {
        self.controller.factoryActions()
        let countActions:Int = self.controller.actions.count
        XCTAssertEqual(countActions, Constants.expectedActions, "Failed to factory actions")
    }
}
