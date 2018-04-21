import XCTest
@testable import catban

class TestLandingController_DataSourceProtocol_Header:XCTestCase {
    private var controller:LandingController<MockLandingProtocol>!
    private var navigation:MockNavigationController!
    private var column:ProjectColumn!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let name:String = "lorem ipsum"
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController<MockLandingProtocol>()
        self.navigation = MockNavigationController()
        self.column = ProjectColumn()
        self.controller.model.returnColumnAtIndex = self.column
        self.column.name = Constants.name
        self.navigation.addChildViewController(self.controller)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.navigation, "Failed to load navigation")
        XCTAssertNotNil(self.column, "Failed to load column")
    }
    
    func testEditHeaderAtClearsCardSelectiopn() {
        self.startExpectation()
        self.controller.model.onClearCardSelection = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.edit(column:self.column)
        
        self.waitExpectation()
    }
    
    func testEditHeaderAtPresentsEditController() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            guard
                let controller:LandingEditController = controller as? LandingEditController
            else { return }
            XCTAssertNotNil(controller.model.onRename, "Failed to assign call back")
            XCTAssertNotNil(controller.model.onDelete, "Failed to assign call back")
            self?.expect?.fulfill()
        }
        
        self.controller.edit(column:self.column)
        
        self.waitExpectation()
    }
    
    func testEditHeaderAtOnRenameCallBack() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            if let controller:LandingEditController = controller as? LandingEditController {
                controller.model.onRename?()
            } else if let _:WriterController<Writer> = controller as? WriterController<Writer> {
                self?.expect?.fulfill()
            }
        }
        
        self.controller.edit(column:self.column)
        
        self.waitExpectation()
    }
    
    func testEditHeaderAtOnDeleteCallBack() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            if let controller:LandingEditController = controller as? LandingEditController {
                controller.model.onDelete?()
            } else if let _:LandingDeleteController = controller as? LandingDeleteController {
                self?.expect?.fulfill()
            }
        }
        
        self.controller.edit(column:self.column)
        
        self.waitExpectation()
    }
    
    func testEditHeaderUsesColumnForRenameCallback() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            if let controller:LandingEditController = controller as? LandingEditController {
                controller.model.onRename?()
            } else if let controller:WriterController<Writer> = controller as? WriterController<Writer> {
                XCTAssertEqual(controller.model.text, self?.column.name, "Invalid text on callback")
                self?.expect?.fulfill()
            }
        }
        
        self.controller.edit(column:self.column)
        
        self.waitExpectation()
    }
    
    func testEditHeaderUsesColumnForDeleteCallback() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            if let controller:LandingEditController = controller as? LandingEditController {
                controller.model.onDelete?()
            } else if let controller:LandingDeleteController = controller as? LandingDeleteController {
                XCTAssertFalse(controller.model.itemName.isEmpty, "Failed to assign item name")
                self?.expect?.fulfill()
            }
        }
        
        self.controller.edit(column:self.column)
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
