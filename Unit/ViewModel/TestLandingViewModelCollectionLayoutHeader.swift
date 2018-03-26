import XCTest
@testable import catban

class TestLandingViewModelCollectionLayoutHeader:XCTestCase {
    private var viewModel:LandingViewModelCollectionLayoutHeader!
    
    override func setUp() {
        super.setUp()
        self.viewModel = LandingViewModelCollectionLayoutHeader()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.viewModel.frame, "Failed to load frame")
        XCTAssertNotNil(self.viewModel.index, "Failed to load index")
    }
}
