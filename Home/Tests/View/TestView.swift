import XCTest
import CleanArchitecture
import Shared
import Canvas
@testable import Home

class TestView:XCTestCase {
    private var view:Home.View!
    private var presenter:MockPresenter!
    private var canvas:MockCanvasProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.canvasType = Canvas.self
        self.view = Home.View()
        self.presenter = MockPresenter()
        self.canvas = MockCanvasProtocol()
        self.presenter.viewModel = ViewModel()
        self.view.presenter = self.presenter
    }
    
    func testMenuButtonCallsPresenter() {
        var called:Bool = false
        self.presenter.onShowMenu = { called = true }
        self.view.selectorMenu(button:UIBarButtonItem())
        XCTAssertTrue(called, "Not called")
    }
    
    func testDidLoadConfiguresCanvas() {
        self.view.didLoad()
        XCTAssertNotNil(self.view.content.viewCanvas, "Failed to assign canvas")
    }
    
    func testShowsMenu() {
        self.view.didLoad()
        var viewModel:ViewModelMenu = ViewModelMenu()
        viewModel.show = true
        self.view.viewModel.update(property:viewModel)
        XCTAssertNotNil(self.view.navigationItem.rightBarButtonItem, "Not showing menu")
    }
    
    func testHidesMenu() {
        self.view.didLoad()
        var viewModel:ViewModelMenu = ViewModelMenu()
        viewModel.show = false
        self.view.viewModel.update(property:viewModel)
        XCTAssertNil(self.view.navigationItem.rightBarButtonItem, "Not hiding menu")
    }
}
