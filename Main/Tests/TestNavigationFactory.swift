import XCTest
@testable import Main

class TestNavigationFactory:XCTestCase {
    func testFactoryWindow() {
        let window:UIWindow? = NavigationFactory.newWindow()
        XCTAssertNotNil(window, "Failed to factory window")
    }
    
    func testFactoryNavigation() {
        let navigation:NavigationProtocol? = NavigationFactory.newNavigation()
        XCTAssertNotNil(navigation, "Failed to factory navigation")
    }
}
