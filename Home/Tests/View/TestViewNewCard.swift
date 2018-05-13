import XCTest
@testable import Home
@testable import Shared

class TestViewNewCard:XCTestCase {
    func testImage() {
        let image:UIImage? = UIImage(name:ViewConstants.NewCard.icon, in:ViewNewCard.self)
        XCTAssertNotNil(image, "Failed loading image")
    }
}
