import XCTest
@testable import Main
@testable import Shared

class TestNavigation:XCTestCase {
    private var model:Navigation!
    private var view:MockNavigationController!
    private var controller:MockControllerProtocol!
    
    override func setUp() {
        super.setUp()
        self.model = Navigation()
        self.view = MockNavigationController()
        self.controller = MockControllerProtocol()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNil(self.model.view, "View should be initially not set")
    }
    
    func testLaunch() {
        let window:UIWindow = self.model.launch()
        XCTAssertNotNil(self.model.view, "Failed to load view")
        XCTAssertNotNil(window.rootViewController, "Failed to assign root controller")
    }
    
    func testNavigateToController() {
        var viewUpdated:Bool = false
        self.model.view = self.view
        self.view.onSetViewController = { [weak self] (views:[UIViewController], animated:Bool) in
            XCTAssertEqual(views.count, 1, "Invalid amount of views recevied")
            XCTAssertEqual(views.first, self?.controller.presenter.view, "Invalid view received")
            viewUpdated = true
        }
        
        self.model.navigateTo(controller:self.controller)
        XCTAssertTrue(viewUpdated, "Failed to update view")
    }
    
    func testFirstController() {
        self.model.view = self.view
        self.view.onSetViewController = { (views:[UIViewController], animated:Bool) in
            let view:ControllerProtocol? = views.first as? ControllerProtocol
            XCTAssertNotNil(view, "Invalid view received")
        }
        
        let _:UIWindow = self.model.launch()
    }
}
