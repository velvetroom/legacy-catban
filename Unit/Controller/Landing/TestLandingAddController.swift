import XCTest
@testable import catban

class TestLandingAddController:XCTestCase {
    private var controller:LandingAddController!
    private struct Constants {
        static let expectedActions:Int = 4
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingAddController()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.model, "Failed to load model")
    }
    
    func testViewDidLoad() {
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        XCTAssertGreaterThan(self.controller.actions.count, 0, "Not loading actions on view did load")
        XCTAssertNotNil(self.controller.model.presenter.actionCancel, "Failed to load cancel")
        XCTAssertNotNil(self.controller.model.presenter.actionCard, "Failed to load card")
        XCTAssertNotNil(self.controller.model.presenter.actionColumn, "Failed to load column")
        XCTAssertNotNil(self.controller.model.presenter.actionProject, "Failed to load project")
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
