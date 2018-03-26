import XCTest
@testable import catban

class TestLandingViewModelLoaderCollectionLayout:XCTestCase {
    private var loader:LandingViewModelLoaderCollectionLayout!
    private var project:Project!
    
    override func setUp() {
        super.setUp()
        self.loader = LandingViewModelLoaderCollectionLayout()
        self.project = Project.factoryNewProject()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.loader, "Failed to load loader")
    }
    
    func testFactory() {
        let viewModel:LandingViewModelCollectionLayout = self.loader.factoryWith(project:self.project)
        XCTAssertNotNil(viewModel, "Failed to factory view model")
    }
}
