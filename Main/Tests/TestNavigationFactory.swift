import XCTest
@testable import Main

class TestNavigationFactory:XCTestCase {
    func testFactoryWindow() {
        let window:UIWindow? = NavigationFactory.newWindow()
        XCTAssertNotNil(window, "Failed to factory window")
    }
    
    func testFactoryView() {
        let view:UINavigationController? = NavigationFactory.newView()
        XCTAssertNotNil(view, "Failed to factory view")
    }
}
