import XCTest
@testable import Main

class TestNavigation:XCTestCase {
    private var model:Navigation!
    
    override func setUp() {
        super.setUp()
        self.model = Navigation()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNil(self.model.view, "View should not be set")
    }
    
    func testLaunch() {
        let window:UIWindow = self.model.launch()
        XCTAssertNotNil(self.model.view, "Failed to load view")
        XCTAssertNotNil(window.rootViewController, "Failed to assign root controller")
    }
}
