import XCTest
import Shared
import Canvas
@testable import Home

class TestController:XCTestCase {
    private var controller:Controller!
    
    override func setUp() {
        super.setUp()
        Configuration.canvasType = Canvas.self
        self.controller = Controller()
    }
    
    func testPresenterAssignamentAfterLoad() {
        XCTAssertNotNil(self.controller.presenter.delegate, "Failed to assign delegate to presenter")
    }
    
    func testAssignControllerToPresenter() {
        let presenter:Presenter = self.controller.presenter as! Presenter
        XCTAssertNotNil(presenter.controller, "Failed to inject controller to presenter")
    }
    
    func testTransitionIsNotRetained() {
        self.controller.transiton = MockTransitionProtocol()
        XCTAssertNil(self.controller.transiton, "Strong retained")
    }
}
