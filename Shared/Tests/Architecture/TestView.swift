import XCTest
@testable import Shared

class TestView:XCTestCase {
    func testNotRetainingTransition() {
        let view:MockView = MockView()
        view.transition = MockTransitionProtocol()
        XCTAssertNil(view.transition, "Retains")
    }
    
    func testInjectsViewOnPresenter() {
        let view:MockView = MockView()
        XCTAssertNotNil(view.presenter.view, "Not injected")
    }
    
    func testInitWithPresenterNotInjectingView() {
        let presenter:MockPresenterProtocol = PresenterFactory.makePresenter()
        let _:MockView = MockView(presenter:presenter)
        XCTAssertNil(presenter.view, "Injecting/replacing view on presenter")
    }
    
    func testViewContent() {
        let view:MockView = MockView()
        let content:MockUIView? = view.view as? MockUIView
        XCTAssertNotNil(content, "Invalid content type")
    }
    
    func testCallsPresenterOnViewDidLoad() {
        let presenter:MockPresenterProtocol = PresenterFactory.makePresenter()
        let view:MockView = MockView(presenter:presenter)
        var called:Bool = false
        presenter.onDidLoad = { called = true }
        view.viewDidLoad()
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsInteractorOnViewDidLoad() {
        let presenter:MockPresenterProtocol = PresenterFactory.makePresenter()
        let view:MockView = MockView(presenter:presenter)
        var called:Bool = false
        presenter.interactor.onDidLoad = { called = true }
        view.viewDidLoad()
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsPresenterOnViewWillAppear() {
        let presenter:MockPresenterProtocol = PresenterFactory.makePresenter()
        let view:MockView = MockView(presenter:presenter)
        var called:Bool = false
        presenter.onWillAppear = { called = true }
        view.viewWillAppear(false)
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsPresenterOnViewDidAppear() {
        let presenter:MockPresenterProtocol = PresenterFactory.makePresenter()
        let view:MockView = MockView(presenter:presenter)
        var called:Bool = false
        presenter.onDidAppear = { called = true }
        view.viewDidAppear(false)
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsPresenterOnOrientationChange() {
        let presenter:MockPresenterProtocol = PresenterFactory.makePresenter()
        let view:MockView = MockView(presenter:presenter)
        var called:Bool = false
        presenter.onOrientationChanged = { called = true }
        view.viewWillTransition(to:CGSize.zero, with:MockTransitionCoordinator())
        XCTAssertTrue(called, "Not called")
    }
    
    func testInjectContentWithPresenter() {
        let presenter:MockPresenterProtocol = PresenterFactory.makePresenter()
        let view:MockView = MockView(presenter:presenter)
        XCTAssertNotNil(view.content, "Not injected")
    }
    
    func testInjectContentWithoutPresenter() {
        let view:MockView = MockView()
        XCTAssertNotNil(view.content, "Not injected")
    }
}
