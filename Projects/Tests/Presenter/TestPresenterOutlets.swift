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
    
    func testNotRetainingEmpty() {
        self.presenter.empty = ViewEmpty()
        XCTAssertNil(self.presenter.empty, "Retains")
    }
    
    func testNotRetainingRenamer() {
        self.presenter.renamer = ViewRenamer()
        XCTAssertNil(self.presenter.renamer, "Retains")
    }
    
    func testNotRetainingView() {
        self.presenter.view = View()
        XCTAssertNil(self.presenter.view, "Retains")
    }
}
