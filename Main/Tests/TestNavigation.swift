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
        XCTAssertNil(self.model.window, "Window should not be set")
    }
    
    func testLaunch() {
        self.model.launch()
        XCTAssertNotNil(self.model.window, "Failed to load window")
        XCTAssertNotNil(self.model.window.rootViewController, "Failed to assign root controller")
    }
}
