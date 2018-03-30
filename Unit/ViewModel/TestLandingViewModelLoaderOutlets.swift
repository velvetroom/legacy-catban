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
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.loader, "Failed to load loader")
        XCTAssertNotNil(self.loader.collectionLayout, "Failed to load collection layout")
    }
    
    func testFactory() {
        let viewModel:LandingViewModelOutlets = self.loader.factoryWith(project:self.project)
        XCTAssertNotNil(viewModel, "Failed to factorise view model")
    }
    
    func testReloadCollectionOnFirstTime() {
        let viewModel:LandingViewModelOutlets = self.loader.factoryWith(project:self.project)
        XCTAssertTrue(viewModel.reloadCollection, "Collection should reload on first time")
    }
    
    func testNeverReloadCollectionAgain() {
        var viewModel:LandingViewModelOutlets = self.loader.factoryWith(project:self.project)
        viewModel = self.loader.factoryWith(project:self.project)
        XCTAssertFalse(viewModel.reloadCollection, "Collection should not reload after first time")
    }
    
    func testUpdateViewModelForSelectedCell() {
        let index:IndexPath = IndexPath(item:0, section:0)
        let viewModel:LandingViewModelOutlets = self.loader.factoryWith(project:self.project, and:index)
        XCTAssertLessThan(viewModel.collectionMenuBottom, LandingController.Constants.collectionMenuHeight,
                          "Menu bottom not updating to display")
    }
}
