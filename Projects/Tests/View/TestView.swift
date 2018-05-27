import XCTest
@testable import Projects

class TestView:XCTestCase {
    private var view:View!
    
    override func setUp() {
        super.setUp()
        self.view = View()
    }
    
    func testNotRetainingPresenter() {
        self.view.presenter = Presenter()
        XCTAssertNil(self.view.presenter, "Retains")
    }
    
    func testNotRetainingBase() {
        self.view.viewBase = ViewBase()
        XCTAssertNil(self.view.viewBase, "Retains")
    }
}
