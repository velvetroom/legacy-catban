import XCTest
@testable import catban

class TestLandingViewModelCollectionMenu:XCTestCase {
    private var viewModel:LandingViewModelCollectionMenu!
    
    override func setUp() {
        super.setUp()
        self.viewModel = LandingViewModelCollectionMenu()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertFalse(self.viewModel.moveRightEnabled, "By default move right should be disabled")
        XCTAssertFalse(self.viewModel.moveLeftEnabled, "By default move left should be disabled")
        XCTAssertEqual(self.viewModel.layoutBottom, LandingViewModel.Constants.collectionMenuHeight,
                        "By default move layout bottom should be equals to menu height")
    }
}
