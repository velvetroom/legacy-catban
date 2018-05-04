import XCTest
@testable import Shared

class TestPresenter:XCTestCase {
    private var presenter:PresenterProtocol!
    
    override func setUp() {
        super.setUp()
        self.presenter = MockPresenterProtocol()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.view, "Failed to load view")
        XCTAssertNotNil(self.presenter.controller, "Controller should not be assigned")
    }
}
