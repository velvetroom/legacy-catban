import XCTest
@testable import Card

class TestController:XCTestCase {
    private var controller:Controller!
    
    override func setUp() {
        super.setUp()
        self.controller = Controller()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
    }
    
    func testPresenter() {
        XCTAssertNotNil(self.controller.presenter, "Failed to load")
        XCTAssertNotNil(self.controller.presenter.delegate, "Failed to assign")
    }
    
    func testControllerOnPresenter() {
        let presenter:Presenter = self.controller.presenter as! Presenter
        XCTAssertNotNil(presenter.controller, "Failed to assign")
    }
}
