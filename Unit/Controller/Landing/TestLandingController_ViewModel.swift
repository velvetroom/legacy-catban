import XCTest
@testable import catban

class TestLandingController_ViewModel:XCTestCase {
    private var controller:LandingController!
    private var presenter:MockLandingPresenterCollection!
    private var dataSource:MockLandingPresenterCollectionDataSource!
    private var layout:MockLandingViewCollectionLayout!
    private var project:Project!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let testTitle:String = "test"
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController()
        self.layout = MockLandingViewCollectionLayout()
        self.controller.model.viewModelLoader = MockLandingViewModelLoader()
        self.presenter = MockLandingPresenterCollection()
        self.dataSource = MockLandingPresenterCollectionDataSource()
        self.presenter.dataSource = self.dataSource
        self.controller.model.presenter.collection = self.presenter
        self.project = Project.factoryNewProject()
        self.controller.model.project = self.project
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.model.viewModelLoader, "Failed to load view model loader")
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.dataSource, "Failed to load data source")
        XCTAssertNotNil(self.layout, "Failed to load layout")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testDelegateReceivesViewModelAfterViewDidLoad() {
        self.startExpectation()
        self.dataSource.onDidSetViewModel = { [weak self] in
            self?.expect?.fulfill()
        }
        
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        
        self.waitExpectations()
    }
    
    func testLayoutReceivesViewModelAfterReloadViewModel() {
        self.startExpectation()
        
        self.layout.onViewModelSet = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.model.presenter.outlets.list.layoutCollection = self.layout
        self.controller.model.reloadViewModel()
        
        self.waitExpectations()
    }
    
    func testUpdateTitle() {
        var viewModel:LandingViewModel = LandingViewModel()
        viewModel.outlets.title = Constants.testTitle
        XCTAssertNotNil(self.controller.view)
        
        self.controller.model.presenter.update(viewModel:viewModel)
        
        XCTAssertEqual(self.controller.title, Constants.testTitle, "Failed to update controller title")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
