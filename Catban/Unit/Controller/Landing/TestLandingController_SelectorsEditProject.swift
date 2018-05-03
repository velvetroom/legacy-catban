import XCTest
@testable import catban

class TestLandingController_SelectorsEditProject:XCTestCase {
    private var controller:LandingController<MockLandingProtocol>!
    private var navigation:MockNavigationController!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController()
        self.navigation = MockNavigationController()
        self.navigation.addChildViewController(self.controller)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.navigation, "Failed to load navigation")
    }
    
    func testSelectorCallsEdit() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            let controller:LandingEditController = controller as! LandingEditController
            XCTAssertNotNil(controller, "Invalid controller type")
            self?.expect?.fulfill()
        }
        
        self.controller.selectorEditProject(sender:UIBarButtonItem())
        
        self.waitExpectations()
    }
    
    func testSelectorSetsItemName() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            let controller:LandingEditController = controller as! LandingEditController
            XCTAssertFalse(controller.model.itemName.isEmpty, "Failed to set item name")
            self?.expect?.fulfill()
        }
        
        self.controller.selectorEditProject(sender:UIBarButtonItem())
        
        self.waitExpectations()
    }
    
    func testSelectorSetsOnRename() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            let controller:LandingEditController = controller as! LandingEditController
            XCTAssertNotNil(controller.model.onRename, "Failed to set on rename")
            self?.expect?.fulfill()
        }
        
        self.controller.selectorEditProject(sender:UIBarButtonItem())
        
        self.waitExpectations()
    }
    
    func testSelectorSetsOnDelete() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            let controller:LandingEditController = controller as! LandingEditController
            XCTAssertNotNil(controller.model.onDelete, "Failed to set on delete")
            self?.expect?.fulfill()
        }
        
        self.controller.selectorEditProject(sender:UIBarButtonItem())
        
        self.waitExpectations()
    }
    
    func testSelectorClearsCardSelection() {
        self.startExpectation()
        self.controller.model.onClearCardSelection = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.selectorEditProject(sender:UIBarButtonItem())
        
        self.waitExpectations()
    }
    
    func testSelectorOnRenameOpensWriter() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            if let controller:LandingEditController = controller as? LandingEditController {
                controller.model.onRename?()
            } else if let _:WriterController<Writer> = controller as? WriterController<Writer> {
                self?.expect?.fulfill()
            }
        }
        
        self.controller.selectorEditProject(sender:UIBarButtonItem())
        
        self.waitExpectations()
    }
    
    func testSelectorOnDeleteAsksConfirmation() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            if let controller:LandingEditController = controller as? LandingEditController {
                controller.model.onDelete?()
            } else if let controller:LandingDeleteController = controller as? LandingDeleteController {
                XCTAssertNotNil(controller.model.onConfirm, "Failed to assign on confirm")
                XCTAssertFalse(controller.model.itemName.isEmpty, "Failed to assign item name")
                self?.expect?.fulfill()
            }
        }
        
        self.controller.selectorEditProject(sender:UIBarButtonItem())
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
