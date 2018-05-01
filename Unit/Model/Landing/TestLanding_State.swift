import XCTest
@testable import catban

class TestLanding_State:XCTestCase {
    private var model:Landing!
    private struct Constants {
        static let indexPath:IndexPath = IndexPath(item:334, section:123)
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testStandby() {
        self.model.stateStandby()
        let state:LandingStateStandby? = self.model.state as? LandingStateStandby
        XCTAssertNotNil(state, "Failed to update state")
    }
    
    func testEditing() {
        self.model.stateEditing(indexPath:Constants.indexPath)
        
        let state:LandingStateEditing? = self.model.state as? LandingStateEditing
        XCTAssertNotNil(state, "Failed to upate state")
        XCTAssertEqual(state?.indexPath, Constants.indexPath, "Failed to assign index path")
    }
}