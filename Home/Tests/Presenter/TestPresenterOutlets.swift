import XCTest
import Shared
@testable import Home

class TestPresenterOutlets:XCTestCase {
    private var presenter:PresenterOutlets!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterOutlets()
    }
    
    func testNotRetainingView() {
        self.presenter.view = Shared.View()
        XCTAssertNil(self.presenter.view, "Retains")
    }
}
