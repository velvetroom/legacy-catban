import XCTest
@testable import Home
@testable import Board

class TestViewCard:XCTestCase {
    private var view:ViewCard!
    private var controller:MockController!
    
    override func setUp() {
        super.setUp()
        self.view = ViewCard()
        self.controller = MockController()
        self.view.controller = controller
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testProperties() {
        XCTAssertNotNil(self.view.labelContent, "Failed to load property")
        XCTAssertNil(self.view.layoutLeft, "Property not found")
        XCTAssertNil(self.view.layoutTop, "Property not found")
        XCTAssertNil(self.view.layoutHeight, "Property not found")
        XCTAssertNil(self.view.layoutWidth, "Property not found")
    }
    
    func testControllerIsNotRetained() {
        self.view.controller = Controller()
        XCTAssertNil(self.view.controller, "Strong retained controller")
    }
    
    func testCallEditCardOnController() {
        var controllerCalled:Bool = false
        self.view.identifier = String()
        self.controller.onEditCardWith = { (identifier:String) in
            controllerCalled = true
        }
        
        self.view.buttonDidSelect()
        XCTAssertTrue(controllerCalled, "Not called")
    }
}
