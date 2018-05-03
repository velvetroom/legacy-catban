import XCTest
@testable import Shared
@testable import Home

class TestPresenter:XCTestCase {
    private var presenter:Presenter!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.view, "Failed to load view")
        XCTAssertNotNil(self.presenter.view.delegate, "Failed to assign delegate")
        XCTAssertNil(self.presenter.controller, "Controller should be not initially set")
    }
}
