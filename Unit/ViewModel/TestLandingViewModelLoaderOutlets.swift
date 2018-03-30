import XCTest
@testable import catban

class TestLandingViewModelLoaderOutlets:XCTestCase {
    private var project:Project!
    private var loader:LandingViewModelLoaderOutlets!
    
    override func setUp() {
        super.setUp()
        self.project = Project.factoryNewProject()
        self.loader = LandingViewModelLoaderOutlets()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.loader, "Failed to load loader")
        XCTAssertNotNil(self.loader.collectionLayout, "Failed to load collection layout")
    }
    
    func testFactory() {
        let viewModel:LandingViewModelOutlets = self.loader.factoryWith(project:project)
        XCTAssertNotNil(viewModel, "Failed to factorise view model")
    }
    
    func testReloadCollectionOnFirstTime() {
        let viewModel:LandingViewModelOutlets = self.loader.factoryWith(project:project)
        XCTAssertTrue(viewModel.reloadCollection, "Collection should reload on first time")
    }
    
    func testNeverReloadCollectionAgain() {
        var viewModel:LandingViewModelOutlets = self.loader.factoryWith(project:project)
        viewModel = self.loader.factoryWith(project:project)
        XCTAssertFalse(viewModel.reloadCollection, "Collection should not reload after first time")
    }
}
