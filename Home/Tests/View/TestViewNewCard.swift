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
        self.view.controller = self.controller
    }
    
    func testImage() {
        let image:UIImage? = UIImage(name:ViewConstants.NewCard.icon, in:ViewNewCard.self)
        XCTAssertNotNil(image, "Failed loading image")
    }
    
    func testButtonCallsController() {
        var controllerCalled:Bool = false
        self.controller.onCreateNewCard = {
            controllerCalled = true
        }
        
        self.view.buttonDidSelect()
        XCTAssertTrue(controllerCalled, "Not called")
    }
}
