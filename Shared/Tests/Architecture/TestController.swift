import XCTest
@testable import Shared

class TestController:XCTestCase {
    private var controller:MockControllerProtocol!
    private var controllerDefault:ControllerProtocol!
    private var presenter:MockPresenterProtocol!
    
    override func setUp() {
        super.setUp()
        self.controller = MockControllerProtocol()
        self.controllerDefault = MockControllerProtocol_Default()
        self.presenter = MockPresenterProtocol()
        self.controller.presenter = self.presenter
        self.controllerDefault.presenter = self.presenter
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controllerDefault, "Failed to load controller default")
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNil(self.controller.transiton, "Transition should not be set")
    }
    
    func testUpdatePresenterOnLoaded() {
        var updatedPresenter:Bool = false
        self.presenter.onShouldUpdate = {
            updatedPresenter = true
        }
        self.controllerDefault.didLoadPresenter()
        XCTAssertTrue(updatedPresenter, "Failed to update presenter")
    }
}
