import XCTest
import Shared
import Canvas
@testable import Home

class TestViewMenu:XCTestCase {
    private var view:ViewMenu!
    private var presenter:MockPresenterMenu!
    
    override func setUp() {
        super.setUp()
        Configuration.canvasType = Canvas.self
        self.view = ViewMenu()
        self.presenter = MockPresenterMenu()
        self.view.presenter = self.presenter
    }
    
    func testRetainsPresenter() {
        self.view.presenter = PresenterMenu()
        XCTAssertNotNil(self.view.presenter, "Not retaining")
    }
    
    func testCloseCallsPresenter() {
        var called:Bool = false
        self.presenter.onClose = { called = true }
        self.view.selectorClose()
        XCTAssertTrue(called, "Not called")
    }
    
    func testSelectorProjectsCallsPresenter() {
        var called:Bool = false
        self.presenter.onOpenProjects = { called = true }
        self.view.selectorProjects()
        XCTAssertTrue(called, "Not called")
    }
    
    func testSelectorCloudCallsPresenter() {
        var called:Bool = false
        self.presenter.onOpenCloud = { called = true }
        self.view.selectorCloud()
        XCTAssertTrue(called, "Not called")
    }
    
    func testSelectorAboutCallsPresenter() {
        var called:Bool = false
        self.presenter.onOpenAbout = { called = true }
        self.view.selectorAbout()
        XCTAssertTrue(called, "Not called")
    }
}
