import XCTest
import CleanArchitecture
import Shared
@testable import Main

class TestNavigation:XCTestCase {
    private var model:Navigation!
    private var view:MockNavigationView!
    
    override func setUp() {
        super.setUp()
        self.model = Navigation()
        self.view = MockNavigationView()
    }
    
    func testLaunch() {
        let window:UIWindow = self.model.launch()
        XCTAssertNotNil(self.model.view, "Failed to load view")
        XCTAssertNotNil(window.rootViewController, "Failed to assign root controller")
    }
    
    func testNavigateToController() {
        var viewUpdated:Bool = false
        self.model.view = self.view
        self.view.onSetViewController = { (views:[UIViewController], animated:Bool) in
            XCTAssertEqual(views.count, 1, "Invalid amount of views received")
            viewUpdated = true
        }
        
        self.model.transitionToLoad()
        XCTAssertTrue(viewUpdated, "Failed to update view")
    }
    
    func testFirstController() {
        self.model.view = self.view
        self.view.onSetViewController = { (views:[UIViewController], animated:Bool) in
            let view:ViewProtocol? = views.first as? ViewProtocol
            XCTAssertNotNil(view, "Invalid view received")
        }
        
        let _:UIWindow = self.model.launch()
    }
}
