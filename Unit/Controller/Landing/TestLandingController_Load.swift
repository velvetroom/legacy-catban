import XCTest
@testable import catban

class TestLandingController_Load:XCTestCase {
    private var controller:LandingController!
    private var mockPresenter:MockLandingPresenterProtocol!
    private var viewModelLoader:MockLandingViewModelLoader!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.viewModelLoader = MockLandingViewModelLoader()
        self.controller = LandingController()
        self.mockPresenter = MockLandingPresenterProtocol()
        self.controller.model.viewModelLoader = self.viewModelLoader
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.model.viewModelLoader, "Controller doesn't have view model loader")
    }
    
    func testViewModelIsLoadedOnViewDidLoad() {
        self.startExpectation()
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
        self.controller.model.project = Project.factoryFirstProject()
        
        self.controller.model.reloadViewModel()
        
        XCTAssertFalse(self.controller.model.presenter.collection.dataSource.viewModel.sections.isEmpty,
                      "View model not reloading")
    }
    
    func testPresenterReceivesUpdatedViewModel() {
        self.startExpectation()
        self.controller.model.presenter = self.mockPresenter
        self.controller.model.project = Project.factoryFirstProject()
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
