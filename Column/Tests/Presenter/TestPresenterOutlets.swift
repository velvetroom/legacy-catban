import XCTest
@testable import Column

class TestPresenterOutlets:XCTestCase {
    private var presenter:PresenterOutlets!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterOutlets()
    }
    
    func testNotRetainingView() {
        self.presenter.view = View()
        XCTAssertNil(self.presenter.view, "Retains")
    }
}
