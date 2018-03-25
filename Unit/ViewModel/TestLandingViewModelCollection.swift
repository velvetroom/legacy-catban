import XCTest
@testable import catban

class TestLandingViewModelCollection:XCTestCase {
    private var viewModel:LandingViewModelCollection!
    
    override func setUp() {
        super.setUp()
        self.viewModel = LandingViewModelCollection()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
}
