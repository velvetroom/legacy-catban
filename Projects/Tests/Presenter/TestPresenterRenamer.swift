import XCTest
@testable import Projects

class TestPresenterRenamer:XCTestCase {
    private var presenter:PresenterRenamer!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterRenamer()
    }
    
    func testNotRetainingView() {
        self.presenter.view = ViewRenamer()
        XCTAssertNil(self.presenter.view, "Retains")
    }
}
