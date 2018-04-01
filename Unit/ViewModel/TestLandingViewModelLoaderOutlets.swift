import XCTest
@testable import catban

class TestLandingViewModelLoaderOutlets:XCTestCase {
    private var model:Landing!
    private var loader:LandingViewModelLoaderOutlets!
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.loader = LandingViewModelLoaderOutlets()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.loader, "Failed to load loader")
        XCTAssertNotNil(self.loader.collectionLayout, "Failed to load collection layout")
        XCTAssertNotNil(self.loader.collectionMenu, "Failed to load collection menu")
    }
    
    func testFactory() {
        let viewModel:LandingViewModelOutlets = self.loader.factoryWith(model:self.model)
        XCTAssertNotNil(viewModel, "Failed to factorise view model")
    }
    
    func testReloadCollectionOnFirstTime() {
        let viewModel:LandingViewModelOutlets = self.loader.factoryWith(model:self.model)
        XCTAssertTrue(viewModel.reloadCollection, "Collection should reload on first time")
    }
    
    func testNeverReloadCollectionAgain() {
        var viewModel:LandingViewModelOutlets = self.loader.factoryWith(model:self.model)
        viewModel = self.loader.factoryWith(model:self.model)
        XCTAssertFalse(viewModel.reloadCollection, "Collection should not reload after first time")
    }
}
