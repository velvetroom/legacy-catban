import XCTest
@testable import Home

class TestPresenterDrag:XCTestCase {
    private var presenter:PresenterDrag!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterDrag()
    }
    
    func testNotRatainingController() {
        self.presenter.controller = Controller()
        XCTAssertNil(self.presenter.controller, "Retains")
    }
}
