import XCTest
@testable import Shared

class TestViewNewCard:XCTestCase {
    func testImage() {
        let image:UIImage? = UIImage(name:ViewConstants.Card.iconNewCard, in:ViewNewCard.self)
        XCTAssertNotNil(image, "Failed loading image")
    }
}
