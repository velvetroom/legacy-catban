import XCTest
@testable import catban

class TestLandingController_DataSourceProtocol_Cards:XCTestCase {
    private var controller:LandingController!
    private var model:MockLandingProtocol!
    private var navigation:MockNavigationController!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let index:IndexPath = IndexPath(item:23123, section:3422)
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController()
        self.model = MockLandingProtocol()
        self.navigation = MockNavigationController()
        self.controller.model = self.model
        self.navigation.addChildViewController(self.controller)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.navigation, "Failed to load navigation")
    }
    
    func testDeleteItem() {
        self.startExpectation()
        self.navigation.onPresent = { (controller:UIViewController) in
            guard
                let controller:LandingDeleteController = controller as? LandingDeleteController
            else {
                return
            }
            controller.model.onConfirm?()
        }
        self.model.onDeleteCardAt = { [weak self] (index:IndexPath) in
            XCTAssertEqual(index, Constants.index, "Invalid index for deletion")
            self?.expect?.fulfill()
        }
        
        self.controller.deleteItemAt(indexPath:Constants.index)
        
        self.waitExpectation()
    }
    
    func testDeleteItemPresentsDeleteController() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            guard
                let controller:LandingDeleteController = controller as? LandingDeleteController
            else {
                return
            }
            XCTAssertFalse(controller.model.itemName.isEmpty, "Failed to assign item name")
            XCTAssertNotNil(controller.model.onConfirm, "Failed to assign call back")
            self?.expect?.fulfill()
        }
        
        self.controller.deleteItemAt(indexPath:Constants.index)
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
