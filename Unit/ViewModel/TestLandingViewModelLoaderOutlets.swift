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
    }
    
    func testFactory() {
        let viewModel:LandingViewModelOutlets = self.loader.factoryWith(project:project)
        XCTAssertNotNil(viewModel, "Failed to factorise view model")
    }
}
