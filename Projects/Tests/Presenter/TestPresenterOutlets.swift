import XCTest
@testable import Projects

class TestPresenterOutlets:XCTestCase {
    private var presenter:PresenterOutlets!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterOutlets()
    }
    
    func testNotRetainingList() {
        self.presenter.list = ViewList()
        XCTAssertNil(self.presenter.list, "Retains")
    }
    
    func testNotRetainingMenu() {
        self.presenter.menu = ViewMenu()
        XCTAssertNil(self.presenter.menu, "Retains")
    }
    
    func testNotRetainingEmpty() {
        self.presenter.empty = ViewEmpty()
        XCTAssertNil(self.presenter.empty, "Retains")
    }
}