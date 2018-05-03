import XCTest
@testable import catban

class TestErrorPresenter:XCTestCase {
    private var presenter:ErrorPresenter!
    
    override func setUp() {
        super.setUp()
        self.presenter = ErrorPresenter()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNil(self.presenter.actionCancel, "Action should not be set by defaul")
    }
}
