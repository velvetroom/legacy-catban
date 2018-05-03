import XCTest
@testable import Main

class TestApplication:XCTestCase {
    private var app:Application!
    private var navigation:MockNavigationProtocol!
    
    override func setUp() {
        super.setUp()
        self.app = Application()
        self.navigation = MockNavigationProtocol()
        self.app.navigation = self.navigation
    }
    
    func testLoad() {
        XCTAssertNotNil(self.app, "Failed to load app")
        XCTAssertNotNil(self.navigation, "Failed to load navigation")
    }
    
    func testAppLaunch() {
        var navigationLaunched:Bool = false
        self.navigation.onLaunch = {
            navigationLaunched = true
        }
        
        let _:Bool = self.app.application(UIApplication.shared, didFinishLaunchingWithOptions:nil)
        
        XCTAssertTrue(navigationLaunched, "Failed to call navigation on launch")
    }
}
