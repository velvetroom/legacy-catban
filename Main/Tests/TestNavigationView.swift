import XCTest
@testable import Main

class TestNavigationView:XCTestCase {
    private var view:NavigationView!
    
    override func setUp() {
        super.setUp()
        self.view = NavigationView()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
}
