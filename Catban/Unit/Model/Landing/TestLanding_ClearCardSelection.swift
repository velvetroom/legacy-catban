import XCTest
@testable import catban

class TestLanding_ClearCardSelection:XCTestCase {
    private var model:Landing!
    private var collection:MockLandingViewCollection!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.collection = MockLandingViewCollection()
        self.model.presenter.outlets.list.viewCollection = self.collection
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.collection, "Failed to load collection")
    }
    
    func testClearCardSelectionClearCollection() {
        self.startExpectation()
        self.collection.onClearSelection = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.model.clearCardSelection()
        
        self.waitExpectation()
    }
    
    func testClearCardSelectionUpdatesEditingCard() {
        self.model.editingCard = IndexPath(item:0, section:0)
        self.model.clearCardSelection()
        XCTAssertNil(self.model.editingCard, "Failed to clear editing card")
    }
    
    func testClearUpdatesState() {
        self.model.state = LandingStateCardSelected()
        self.model.clearCardSelection()
        let state:LandingStateStandby? = self.model.state as? LandingStateStandby
        XCTAssertNotNil(state, "Failed to update state")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
