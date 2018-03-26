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
        XCTAssertNotNil(self.viewModel.logoHidden, "Failed to load logo hidden property")
        XCTAssertNotNil(self.viewModel.collection, "Failed to load view model for collection")
        XCTAssertNotNil(self.viewModel.collectionLayout, "Failed to load view model layout")
    }
}
