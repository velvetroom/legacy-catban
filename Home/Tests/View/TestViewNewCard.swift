import XCTest
@testable import Home
@testable import Shared

class TestViewNewCard:XCTestCase {
    private var view:ViewNewCard!
    private var controller:MockController!
    
    override func setUp() {
        super.setUp()
        self.view = ViewNewCard()
        self.controller = MockController()
    }
    
    func testImage() {
        let image:UIImage? = UIImage(name:ViewConstants.NewCard.icon, in:ViewNewCard.self)
        XCTAssertNotNil(image, "Failed loading image")
    }
    
    func testSucceded() {
        var called:Bool = false
        self.controller.onCreateNewCard = {
            called = true
        }
        
        self.view.touchSucceded(controller:self.controller)
        XCTAssertTrue(called, "Failed to call")
    }
}
