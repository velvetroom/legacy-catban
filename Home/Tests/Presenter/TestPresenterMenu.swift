import XCTest
@testable import Home

class TestPresenterMenu:XCTestCase {
    private var presenter:PresenterMenu!
    private var view:View!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterMenu()
        self.view = View()
        self.presenter.view = self.view
    }
    
    func testNotRetainingController() {
        self.presenter.controller = Controller()
        XCTAssertNil(self.presenter.controller, "Retains")
    }
    
    func testNotRetainingView() {
        self.presenter.view = View()
        XCTAssertNil(self.presenter.view, "Retains")
    }
    
    func testNotRetainingViewMenu() {
        self.presenter.viewMenu = ViewMenu()
        XCTAssertNil(self.presenter.viewMenu, "Retains")
    }
    
    func testInjectsItselfToView() {
        self.presenter.show()
        XCTAssertNotNil(self.presenter.viewMenu?.presenter, "Not injected")
    }
}
