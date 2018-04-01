import XCTest
@testable import catban

class TestLandingController_Load:XCTestCase {
    private var controller:LandingController!
    private var mockPresenter:MockLandingPresenter!
    private var projectLoader:MockProjectLoader!
    private var viewModelLoader:MockLandingViewModelLoader!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.projectLoader = MockProjectLoader()
        self.viewModelLoader = MockLandingViewModelLoader()
        self.controller = LandingController()
        self.mockPresenter = MockLandingPresenter()
        self.controller.model.projectLoader = self.projectLoader
        self.controller.model.viewModelLoader = self.viewModelLoader
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.model.projectLoader, "Controller doesn't have project loader")
        XCTAssertNotNil(self.controller.model.viewModelLoader, "Controller doesn't have view model loader")
    }
    
    func testProjectIsLoadedOnViewDidLoad() {
        self.startExpectation()
        XCTAssertNil(self.controller.model.project, "Project should be nil before loading")
        self.projectLoader.onLoadCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        
        self.waitExpectations()
    }
    
    func testViewModelIsLoadedOnViewDidLoad() {
        self.startExpectation()
        XCTAssertNil(self.controller.model.project, "Project should be nil before loading")
        self.viewModelLoader.onLoadCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        
        self.waitExpectations()
    }
    
    func testLoadViewModel() {
        XCTAssertTrue(self.controller.model.presenter.collection.dataSource.viewModel.sections.isEmpty,
                      "View model not empty at initiation")
        self.controller.model.viewModelLoader = LandingViewModelLoader()
        self.controller.model.project = Project.factoryNewProject()
        
        self.controller.model.reloadViewModel()
        
        XCTAssertFalse(self.controller.model.presenter.collection.dataSource.viewModel.sections.isEmpty,
                      "View model not reloading")
    }
    
    func testPresenterReceivesUpdatedViewModel() {
        self.startExpectation()
        self.controller.model.presenter = self.mockPresenter
        self.controller.model.project = Project.factoryNewProject()
        self.mockPresenter.onUpdateViewModel = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.model.reloadViewModel()
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
