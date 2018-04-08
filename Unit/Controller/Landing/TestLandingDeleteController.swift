import XCTest
@testable import catban

class TestLandingDeleteController:XCTestCase {
    private var controller:LandingDeleteController!
    private struct Constants {
        static let itemName:String = "lorem ipsum"
        static let expectedActions:Int = 2
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingDeleteController()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
    }
    
    func testViewDidLoad() {
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        XCTAssertGreaterThan(self.controller.actions.count, 0, "Not loading actions on view did load")
        XCTAssertNotNil(self.controller.model.presenter.actionCancel, "Failed to load cancel")
        XCTAssertNotNil(self.controller.model.presenter.actionDelete, "Failed to load delete")
    }
    
    func testPreferredStyle() {
        XCTAssertEqual(self.controller.preferredStyle, UIAlertControllerStyle.actionSheet, "Invalid style")
    }
    
    func testAddActions() {
        self.controller.factoryActions()
        let countActions:Int = self.controller.actions.count
        XCTAssertEqual(countActions, Constants.expectedActions, "Failed to factory actions")
    }
    
    func testItemNameOnAction() {
        self.controller.model.itemName = Constants.itemName
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        
        let actionTitle:String = self.controller.model.presenter.actionDelete!.title!
        
        XCTAssertTrue(actionTitle.contains(Constants.itemName), "Alert title doesn't not contain item name")
    }
}
