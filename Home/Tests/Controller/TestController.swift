import XCTest
@testable import Home

class TestController:XCTestCase {
    private var controller:Controller!
    
    override func setUp() {
        super.setUp()
        self.controller = Controller()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
    }
    
    func testPresenterAssignamentAfterLoad() {
        XCTAssertNotNil(self.controller.presenter.delegate, "Failed to assign delegate to presenter")
    }
    
    func testAssignControllerToPresenter() {
        let presenter:Presenter = self.controller.presenter as! Presenter
        XCTAssertNotNil(presenter.controller, "Failed to inject controller to presenter")
    }
}
