import XCTest
@testable import catban

class TestLandingViewModelCollectionLayout:XCTestCase {
    private var viewModel:LandingViewModelCollectionLayout!
    
    override func setUp() {
        super.setUp()
        self.viewModel = LandingViewModelCollectionLayout()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.viewModel.contentSize, "Failed to load content size")
    }
}
