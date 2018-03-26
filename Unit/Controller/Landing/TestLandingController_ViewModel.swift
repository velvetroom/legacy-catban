import XCTest
@testable import catban

class TestLandingController_ViewModel:XCTestCase {
    private var controller:LandingController!
    private var collectionDelegate:MockLandingCollectionDelegate!
    private var layout:MockLandingViewCollectionLayout!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController()
        self.layout = MockLandingViewCollectionLayout()
        self.controller.projectLoader = MockProjectLoader()
        self.controller.viewModelLoader = MockLandingViewModelLoader()
        self.collectionDelegate = MockLandingCollectionDelegate()
        self.controller.collectionDelegate = self.collectionDelegate
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.projectLoader, "Failed to load project loader")
        XCTAssertNotNil(self.controller.viewModelLoader, "Failed to load view model loader")
        XCTAssertNotNil(self.collectionDelegate, "Failed to load delegate")
    }
    
    func testDelegateReceivesViewModelAfterViewDidLoad() {
        self.startExpectation()
        self.collectionDelegate.onViewModelSet = { [weak self] in
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
        self.controller.outlets.layoutCollection = self.layout
        self.controller.outlets.viewCollection.collectionViewLayout = self.layout
        self.controller.reloadViewModel()
        
        self.waitExpectations()
    }
    
    func testDisplayLogo() {
        var viewModel:LandingViewModel = LandingViewModel()
        viewModel.logoHidden = false
        XCTAssertNotNil(self.controller.view)
        
        self.controller.updateViewModel(viewModel:viewModel)
        
        XCTAssertFalse(self.controller.outlets.imageLogo.isHidden)
    }
    
    func testHideLogo() {
        var viewModel:LandingViewModel = LandingViewModel()
        viewModel.logoHidden = true
        XCTAssertNotNil(self.controller.view)
        
        self.controller.updateViewModel(viewModel:viewModel)
        
        XCTAssertTrue(self.controller.outlets.imageLogo.isHidden)
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
