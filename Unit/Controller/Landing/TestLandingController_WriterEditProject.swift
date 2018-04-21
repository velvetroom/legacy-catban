import XCTest
@testable import catban

class TestLandingController_WriterEditProject:XCTestCase {
    private var controller:LandingController<MockLandingProtocol>!
    private var navigation:MockNavigationController!
    private var project:MockProjectProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let name:String = "lorem ipsum"
        static let updatedName:String = "hello world"
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController<MockLandingProtocol>()
        self.navigation = MockNavigationController()
        self.project = MockProjectProtocol()
        self.project.name = Constants.name
        self.controller.model.project = self.project
        self.navigation.addChildViewController(self.controller)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.navigation, "Failed to load navigation")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testOpenWriterPresentsController() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            self?.expect?.fulfill()
        }
        
        self.controller.openWriterForProject()
        
        self.waitExpectations()
    }
    
    func testOpenWriterConfiguresText() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            guard
                let controller:WriterController<Writer> = controller as? WriterController<Writer>
            else { return }
            XCTAssertEqual(controller.model.text, Constants.name, "Text not configured")
            self?.expect?.fulfill()
        }
        
        self.controller.openWriterForProject()
        
        self.waitExpectations()
    }
    
    func testOpenWriterConfiguresOnFinish() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            guard
                let controller:WriterController<Writer> = controller as? WriterController<Writer>
            else { return }
            XCTAssertNotNil(controller.model.onFinish, "Failed to configure on finish")
            self?.expect?.fulfill()
        }
        
        self.controller.openWriterForProject()
        
        self.waitExpectations()
    }
    
    func testOnFinishUpdatesProject() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            guard
                let controller:WriterController<Writer> = controller as? WriterController<Writer>
            else { return }
            controller.model.onFinish?(Constants.updatedName)
            XCTAssertEqual(self?.project.name, Constants.updatedName, "Failed to update name")
            self?.expect?.fulfill()
        }
        
        self.controller.openWriterForProject()
        
        self.waitExpectations()
    }
    
    func testOnFinishReloadsViewModel() {
        self.startExpectation()
        self.navigation.onPresent = { (controller:UIViewController) in
            guard
                let controller:WriterController<Writer> = controller as? WriterController<Writer>
            else { return }
            controller.model.onFinish?(Constants.updatedName)
        }
        self.controller.model.onReloadViewModel = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.openWriterForProject()
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
