import XCTest
@testable import Home

class TestViewMenu:XCTestCase {
    private var view:ViewMenu!
    private var presenter:MockPresenterMenu!
    
    override func setUp() {
        super.setUp()
        self.view = ViewMenu()
        self.presenter = MockPresenterMenu()
        self.view.presenter = self.presenter
    }
    
    func testNotRetainingBase() {
        self.view.viewBase = ViewMenuBase()
        XCTAssertNil(self.view.viewBase, "Retains")
    }
    
    func testRetainsPresenter() {
        self.view.presenter = PresenterMenu()
        XCTAssertNotNil(self.view.presenter, "Not retaining")
    }
    
    func testCloseCallsPresenter() {
        var called:Bool = false
        self.presenter.onClose = {
            called = true
        }
        
        self.view.selectorClose(button:UIButton())
        XCTAssertTrue(called, "Not called")
    }
}
