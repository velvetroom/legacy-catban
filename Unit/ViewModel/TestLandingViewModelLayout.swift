import XCTest
@testable import catban

class TestLandingViewModelLayout:XCTestCase {
    private var viewModel:LandingViewModelLayout!
    
    override func setUp() {
        super.setUp()
        self.viewModel = LandingViewModelLayout()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
}
