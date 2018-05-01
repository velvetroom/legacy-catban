import XCTest
@testable import catban

class TestLandingStateCardSelected:XCTestCase {
    private var model:LandingStateCardSelected!
    
    override func setUp() {
        super.setUp()
        self.model = LandingStateCardSelected()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.indexPath, "Failed to load index")
    }
}
