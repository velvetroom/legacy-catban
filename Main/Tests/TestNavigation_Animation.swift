import XCTest
@testable import Main

class TestNavigation_Animation:XCTestCase {
    private var model:Navigation!
    private var view:MockNavigationView!
    
    override func setUp() {
        super.setUp()
        Injection().load()
        self.model = Navigation()
        self.view = MockNavigationView()
        self.model.view = self.view
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testNoAnimationWhenNoPreviousController() {
        self.view.onSetViewController = { (controller:[UIViewController], animated:Bool) in
            XCTAssertFalse(animated, "Should not animate transition")
        }
        self.model.transitionTo(view:MockView())
    }
    
    func testAnimateWhenPreviousController() {
        self.view.addChildViewController(UIViewController())
        self.view.onSetViewController = { (controller:[UIViewController], animated:Bool) in
            XCTAssertTrue(animated, "Should animate transition")
        }
        self.model.transitionTo(view:MockView())
    }
}
