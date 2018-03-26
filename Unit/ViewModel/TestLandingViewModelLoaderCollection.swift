import XCTest
@testable import catban

class TestLandingViewModelLoaderCollection:XCTestCase {
    private var project:Project!
    private var loader:LandingViewModelLoaderCollection!
    
    override func setUp() {
        super.setUp()
        self.loader = LandingViewModelLoaderCollection()
        self.project = Project.factoryNewProject()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.loader, "Failed to load collection")
    }
    
    func testFactory() {
        let viewModel:LandingViewModelCollection = self.loader.factoryWith(project:project)
        XCTAssertNotNil(viewModel, "Failed to factory view model")
    }
}
