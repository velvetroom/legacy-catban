import XCTest
@testable import catban

class TestLandingViewModelCollectionLayoutCell:XCTestCase {
    private var viewModel:LandingViewModelCollectionLayoutCell!
    
    override func setUp() {
        super.setUp()
        self.viewModel = LandingViewModelCollectionLayoutCell()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load cell")
        XCTAssertNotNil(self.viewModel.frame, "Failed to load frame")
    }
}
