import XCTest
@testable import Card
@testable import Shared

class TestView:XCTestCase {
    private var view:Card.View!
    private var controller:MockController!
    
    override func setUp() {
        super.setUp()
        self.view = Card.View()
        self.controller = MockController()
        self.view.controller = self.controller
    }
    
    func testTrashImage() {
        let image:UIImage = UIImage(name:ViewConstants.View.iconTrash, in:View.self)
        XCTAssertNotNil(image)
    }
    
    func testControllerNotRetained() {
        self.controller = nil
        XCTAssertNil(self.view.controller, "Strong retained controller")
    }
    
    func testSelectorDone() {
        var calledController:Bool = false
        self.controller.onDone = {
            calledController = true
        }
        
        self.view.selectorDone(sender:UIBarButtonItem())
        XCTAssertTrue(calledController, "Not called")
    }
}
