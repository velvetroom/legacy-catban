import XCTest
@testable import catban

class TestLandingViewModelLoaderCollection:XCTestCase {
    private var model:Landing!
    private var loader:LandingViewModelLoaderCollection!
    
    override func setUp() {
        super.setUp()
        self.loader = LandingViewModelLoaderCollection()
        self.model = Landing()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.loader, "Failed to load collection")
    }
    
    func testFactory() {
        let viewModel:LandingViewModelCollection = self.loader.factoryWith(model:self.model)
        XCTAssertNotNil(viewModel, "Failed to factory view model")
    }
}
