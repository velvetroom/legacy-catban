import XCTest
@testable import catban

class TestLandingController_DataSourceProtocol_Columns_Delete:XCTestCase {
    private var controller:LandingController!
    private var model:MockLandingProtocol!
    private var navigation:MockNavigationController!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let index:Int = 34234
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

    func testDeleteSectionAtPresentsDeleteController() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            guard
                let controller:LandingDeleteController = controller as? LandingDeleteController
            else { return }
            XCTAssertFalse(controller.model.itemName.isEmpty, "Failed to assign item name")
            XCTAssertNotNil(controller.model.onConfirm, "Failed to assign call back")
            self?.expect?.fulfill()
        }
        
        self.controller.deleteSectionAt(index:Constants.index)
        
        self.waitExpectation()
    }
    
    func testDeleteSectionAtOnConfirmCallsModel() {
        self.startExpectation()
        self.navigation.onPresent = { (controller:UIViewController) in
            guard
                let controller:LandingDeleteController = controller as? LandingDeleteController
            else { return }
            controller.model.onConfirm?()
        }
        
        self.model.onDeleteColumnAt = { [weak self] (index:Int) in
            XCTAssertEqual(index, Constants.index, "Invalid index for deletion")
            self?.expect?.fulfill()
        }
        
        self.controller.deleteSectionAt(index:Constants.index)
        
        self.waitExpectation()
    }
    
    func testConfirmedDeleteSectionAtThrows() {
        self.startExpectation()
        self.model.throwingError = ErrorProject.oneColumnMinimum
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            let controller:ErrorController? = controller as? ErrorController
            XCTAssertNotNil(controller, "Failed to present error controller")
            self?.expect?.fulfill()
        }
        
        self.controller.confirmedDeleteSectionAt(index:Constants.index)
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
