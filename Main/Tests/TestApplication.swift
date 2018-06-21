import XCTest
@testable import Main

class TestApplication:XCTestCase {
    private var app:Application!
    
    override func setUp() {
        super.setUp()
        self.app = Application()
    }
    
    func testAppLaunch() {
        let _:Bool = self.app.application(UIApplication.shared, didFinishLaunchingWithOptions:nil)
        XCTAssertNotNil(self.app.window, "Failed to launch")
    }
}
