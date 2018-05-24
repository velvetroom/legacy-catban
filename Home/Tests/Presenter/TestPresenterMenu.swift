import XCTest
@testable import Home

class TestPresenterMenu:XCTestCase {
    private var presenter:PresenterMenu!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterMenu()
    }
    
    func testNotRetainingController() {
        self.presenter.controller = Controller()
        XCTAssertNil(self.presenter.controller, "Retains")
    }
    
    func testNotRetainingView() {
        self.presenter.view = View()
        XCTAssertNil(self.presenter.view, "Retains")
    }
}
