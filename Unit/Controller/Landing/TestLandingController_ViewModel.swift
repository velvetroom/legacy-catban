import XCTest
@testable import catban

class TestLandingController_ViewModel:XCTestCase {
    private var controller:LandingController!
    private var presenter:MockLandingPresenterCollection!
    private var dataSource:MockLandingPresenterCollectionDataSource!
    private var layout:MockLandingViewCollectionLayout!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let testTitle:String = "test"
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController()
        self.layout = MockLandingViewCollectionLayout()
        self.controller.projectLoader = MockProjectLoader()
        self.controller.viewModelLoader = MockLandingViewModelLoader()
        self.presenter = MockLandingPresenterCollection()
        self.dataSource = self.presenter.dataSource as? MockLandingPresenterCollectionDataSource
        self.controller.presenter.collection = self.presenter
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.projectLoader, "Failed to load project loader")
        XCTAssertNotNil(self.controller.viewModelLoader, "Failed to load view model loader")
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.dataSource, "Failed to load data source")
    }
    
    func testDelegateReceivesViewModelAfterViewDidLoad() {
        self.startExpectation()
        self.dataSource.onViewModelSet = { [weak self] in
            self?.expect?.fulfill()
        }
        
        XCTAssertNotNil(self.controller.view)
        
        self.waitExpectations()
    }
    
    func testLayoutReceivesViewModelAfterViewDidLoad() {
        self.startExpectation()
        
        self.layout.onViewModelSet = { [weak self] in
            self?.expect?.fulfill()
            self?.expect = nil
        }
        
        XCTAssertNotNil(self.controller.view)
        self.controller.presenter.outlets.list.layoutCollection = self.layout
        self.controller.presenter.outlets.list.viewCollection.collectionViewLayout = self.layout
        self.controller.reloadViewModel(reloadCollection:false)
        
        self.waitExpectations()
    }
    
    func testDisplayLogo() {
        var viewModel:LandingViewModel = LandingViewModel()
        viewModel.outlets.logoHidden = false
        XCTAssertNotNil(self.controller.view)
        
        self.controller.updateViewModel(viewModel:viewModel, reloadCollection:false)
        
        XCTAssertFalse(self.controller.presenter.outlets.list.imageLogo.isHidden)
    }
    
    func testHideLogo() {
        var viewModel:LandingViewModel = LandingViewModel()
        viewModel.outlets.logoHidden = true
        XCTAssertNotNil(self.controller.view)
        
        self.controller.updateViewModel(viewModel:viewModel, reloadCollection:false)
        
        XCTAssertTrue(self.controller.presenter.outlets.list.imageLogo.isHidden)
    }
    
    func testUpdateTitle() {
        var viewModel:LandingViewModel = LandingViewModel()
        viewModel.outlets.title = Constants.testTitle
        XCTAssertNotNil(self.controller.view)
        
        self.controller.updateViewModel(viewModel:viewModel, reloadCollection:false)
        
        XCTAssertEqual(self.controller.title, Constants.testTitle, "Failed to update controller title")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
