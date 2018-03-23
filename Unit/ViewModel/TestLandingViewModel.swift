import XCTest
@testable import catban

class TestLandingViewModel:XCTestCase {
    private var viewModel:LandingViewModel!
    
    override func setUp() {
        super.setUp()
        self.viewModel = LandingViewModel()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
}
