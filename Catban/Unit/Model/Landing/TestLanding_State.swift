import XCTest
@testable import catban

class TestLanding_State:XCTestCase {
    private var model:Landing!
    private var viewModelLoader:MockLandingViewModelLoader!
    private var view:MockLandingViewCollection!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let indexPath:IndexPath = IndexPath(item:334, section:123)
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.viewModelLoader = MockLandingViewModelLoader()
        self.view = MockLandingViewCollection()
        self.model.viewModelLoader = self.viewModelLoader
        self.model.presenter.outlets.list.viewCollection = self.view
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.viewModelLoader, "Failed to load view model loader")
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testInitialState() {
        let state:LandingStateStandby? = self.model.state as? LandingStateStandby
        XCTAssertNotNil(state, "Initial state should be standby")
    }
    
    func testStandby() {
        self.model.stateStandby()
        
        let state:LandingStateStandby? = self.model.state as? LandingStateStandby
        XCTAssertNotNil(state, "Failed to update state")
    }
    
    func testStandbyUpdatesDelegate() {
        self.model.stateStandby()
        
        let delegate:Landing? = self.model.state.delegate as? Landing
        XCTAssertTrue(delegate === self.model, "Failed to assign delegate")
    }
    
    func testStandbyReloadsViewModel() {
        self.startExpectation()
        self.viewModelLoader.onLoadCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.stateStandby()
        self.waitExpectations()
    }
    
    func testCardSelected() {
        self.model.stateCardSelected(indexPath:Constants.indexPath)
        
        let state:LandingStateCardSelected? = self.model.state as? LandingStateCardSelected
        XCTAssertNotNil(state, "Failed to upate state")
        XCTAssertEqual(state?.indexPath, Constants.indexPath, "Failed to assign index path")
    }
    
    func testCardSelectedUpdatesDelegate() {
        self.model.stateCardSelected(indexPath:Constants.indexPath)
        
        let delegate:Landing? = self.model.state.delegate as? Landing
        XCTAssertTrue(delegate === self.model, "Failed to assign delegate")
    }
    
    func testCardSelectedReloadsViewModel() {
        self.startExpectation()
        self.viewModelLoader.onLoadCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.stateCardSelected(indexPath:Constants.indexPath)
        self.waitExpectations()
    }
    
    func testCardSelectedScrollsToCard() {
        self.startExpectation()
        self.view.onScrollToItem = { [weak self] (indexPath:IndexPath) in
            XCTAssertEqual(indexPath, Constants.indexPath, "Invalid index path received")
            self?.expect?.fulfill()
        }
        
        self.model.stateCardSelected(indexPath:Constants.indexPath)
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
