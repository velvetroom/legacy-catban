import XCTest
import Shared
import Canvas
@testable import Home

class TestView:XCTestCase {
    private var view:Home.View!
    private var presenter:MockPresenter!
    
    override func setUp() {
        super.setUp()
        Configuration.canvasType = Canvas.self
        self.view = Home.View()
        self.presenter = MockPresenter()
        self.view.presenter = self.presenter
    }
    
    func testLoadImage() {
        let image:UIImage? = UIImage(name:ViewConstants.Menu.icon, in:Home.View.self)
        XCTAssertNotNil(image, "Failed to load image")
    }
    
    func testMenuButtonCallsPresenter() {
        var called:Bool = false
        self.presenter.onShowMenu = { called = true }
        self.view.selectorMenu(button:UIBarButtonItem())
        XCTAssertTrue(called, "Not called")
    }
}
