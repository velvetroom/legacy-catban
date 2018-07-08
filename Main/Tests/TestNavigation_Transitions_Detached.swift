import XCTest
@testable import Main

class TestNavigation_Transitions_Detached:XCTestCase {
    private var model:Navigation!
    private var view:MockNavigationView!
    
    override func setUp() {
        super.setUp()
        Injection().load()
        self.model = Navigation()
        self.view = MockNavigationView()
        self.model.view = self.view
    }
    
    func testPushInjectsTransition() {
        var transitioned:Bool = false
        self.view.onPush = { (viewController:UIViewController) in
            let view:MockView? = viewController as? MockView
            XCTAssertNotNil(view?.transition, "Not transition injected")
            transitioned = true
        }
        
        self.model.pushTo(view:MockView())
        XCTAssertTrue(transitioned, "Transition never happened")
    }
    
    func testPresentInjectsTransition() {
        var transitioned:Bool = false
        self.view.onPresent = { (viewController:UIViewController) in
            let view:MockView? = viewController as? MockView
            XCTAssertNotNil(view?.transition, "Not transition injected")
            transitioned = true
        }
        
        self.model.present(view:MockView())
        XCTAssertTrue(transitioned, "Transition never happened")
    }
    
    func testPresentAnimatedInjectsTransition() {
        var transitioned:Bool = false
        self.view.onPresent = { (viewController:UIViewController) in
            let view:MockView? = viewController as? MockView
            XCTAssertNotNil(view?.transition, "Not transition injected")
            transitioned = true
        }
        
        self.model.presentAnimated(view:MockView(), completion:nil)
        XCTAssertTrue(transitioned, "Transition never happened")
    }
}
