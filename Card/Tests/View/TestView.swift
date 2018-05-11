import XCTest
@testable import Card
@testable import Shared

class TestView:XCTest {
    private var view:Card.View!
    
    override func setUp() {
        super.setUp()
        self.view = Card.View()
    }
    
    func testTrashImage() {
        let image:UIImage = UIImage(name:ViewConstants.View.iconTrash, in:View.self)
        XCTAssertNotNil(image)
    }
}
