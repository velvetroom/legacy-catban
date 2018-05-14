import XCTest
@testable import Home
@testable import Shared

class TestViewNewCard:XCTestCase {
    private var view:ViewNewCard!
    
    override func setUp() {
        super.setUp()
        self.view = ViewNewCard()
    }
    
    func testImage() {
        let image:UIImage? = UIImage(name:ViewConstants.NewCard.icon, in:ViewNewCard.self)
        XCTAssertNotNil(image, "Failed loading image")
    }
}
