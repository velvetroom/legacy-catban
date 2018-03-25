import XCTest
@testable import catban

class TestLandingViewModelLoader:XCTestCase {
    private var project:Project!
    private var loader:LandingViewModelLoader!
    
    override func setUp() {
        super.setUp()
        self.project = Project.factoryNewProject()
        self.loader = LandingViewModelLoader()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.loader, "Failed to load loader")
    }
    
    func testLoadViewModel() {
        let viewModel:LandingViewModel = self.loader.factoryViewModelWith(project:project)
        self.validateViewModel(viewModel:viewModel)
    }
    
    private func validateViewModel(viewModel:LandingViewModel) {
        XCTAssertEqual(self.project.columns.count, viewModel.collection.sections.count, "Invalid number of sections")
    }
}
