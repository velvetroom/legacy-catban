import XCTest
@testable import catban

class TestLandingController_Selectors:XCTestCase {
    private var controller:LandingController!
    private var collection:MockLandingViewCollection!
    private var viewModelLoader:MockLandingViewModelLoader!
    private var project:Project!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController()
        self.collection = MockLandingViewCollection()
        self.viewModelLoader = MockLandingViewModelLoader()
        self.project = Project.factoryNewProject()
        self.controller.model.viewModelLoader = self.viewModelLoader
        self.controller.model.presenter.outlets.list.viewCollection = self.collection
        self.controller.model.project = self.project
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.collection, "Failed to load collection")
        XCTAssertNotNil(self.viewModelLoader, "Failed ot load view model")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testSelectorCloseEditingCardClearsSelection() {
        self.setupSelectorCloseEditingCardClearsSelection()
        
        self.controller.selectorCloseEditingCard(sender:UIButton())
        
        XCTAssertTrue(self.collection.indexPathsForSelectedItems!.isEmpty, "Failed to clear selection")
    }
    
    func testReloadViewModelOnCloseEditingCard() {
        self.startExpectation()
        self.viewModelLoader.onLoadCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.selectorCloseEditingCard(sender:UIButton())
        
        self.waitExpectations()
    }
    
    private func setupSelectorCloseEditingCardClearsSelection() {
        self.collection.selectItem(at:IndexPath(item:0, section:0), animated:false,
                                   scrollPosition:UICollectionViewScrollPosition())
        
        let selectedIndexes:[IndexPath]? = collection.indexPathsForSelectedItems
        XCTAssertNotNil(selectedIndexes, "Failed to setup selected indexes")
        XCTAssertFalse(selectedIndexes!.isEmpty, "Failed to select index")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
