import XCTest
@testable import Main
@testable import Shared

class TestNavigationFactory:XCTestCase {
    func testFactoryWindow() {
        let window:UIWindow? = NavigationFactory.newWindow()
        XCTAssertNotNil(window, "Failed to factory window")
    }
}
