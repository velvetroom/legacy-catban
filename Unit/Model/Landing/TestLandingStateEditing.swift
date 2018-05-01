import XCTest
@testable import catban

class TestLandingStateEditing:XCTestCase {
    private var model:LandingStateEditing!
    
    override func setUp() {
        super.setUp()
        self.model = LandingStateEditing()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.indexPath, "Failed to load index")
    }
}
