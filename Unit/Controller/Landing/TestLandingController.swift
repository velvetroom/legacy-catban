import XCTest
@testable import catban

class TestLandingController:XCTestCase {
    private var controller:LandingController!
    private var projectLoader:MockProjectLoader!
    private var viewModelLoader:MockLandingViewModel!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.projectLoader = MockProjectLoader()
        self.viewModelLoader = MockLandingViewModel()
        self.controller = LandingController()
        self.controller.projectLoader = self.projectLoader
        self.controller.viewModelLoader = self.viewModelLoader
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.outlets, "Controller doesn't have outlets")
        XCTAssertNotNil(self.controller.projectLoader, "Controller doesn't have project loader")
        XCTAssertNotNil(self.controller.viewModelLoader, "Controller doesn't have view model loader")
        XCTAssertNotNil(self.controller.collectionDelegate, "Controller doesn't have a collection delegate")
    }
    
    func testOutletsAreLoaded() {
        XCTAssertNotNil(self.controller.view, "Unable to load view from controller")
        XCTAssertNotNil(self.controller.title, "Controller title not loaded")
        XCTAssertNotNil(self.controller.outlets.imageLogo, "Image logo not loaded")
        XCTAssertNotNil(self.controller.outlets.imageLogo.image, "Image logo doesn't have an image")
        XCTAssertNotNil(self.controller.outlets.viewCollection, "View collection not loaded")
    }
    
    func testProjectIsLoadedOnViewDidLoad() {
        self.startExpectation()
        XCTAssertNil(self.controller.project, "Project should be nil before loading")
        self.projectLoader.onLoadCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        self.waitExpectations()
    }
    
    func testViewModelIsLoadedOnViewDidLoad() {
        self.startExpectation()
        XCTAssertNil(self.controller.project, "Project should be nil before loading")
        self.viewModelLoader.onLoadCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        self.waitExpectations()
    }
    
    func testLoadProject() {
        self.startExpectation()
        
        self.controller.loadProject { [weak self] (project:Project) in
            XCTAssertTrue(Thread.isMainThread, "Response should be on main thread")
            self?.expect?.fulfill()
        }
        
        self.waitExpectations()
    }
    
    func testLoadViewModel() {
        self.startExpectation()
        self.controller.project = Project.factoryNewProject()
        
        self.controller.loadViewModel { [weak self] (viewModel:LandingViewModel) in
            XCTAssertTrue(Thread.isMainThread, "Response should be on main thread")
            self?.expect?.fulfill()
        }
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
