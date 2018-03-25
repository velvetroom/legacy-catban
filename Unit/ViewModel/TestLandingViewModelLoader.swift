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
        self.validateCollection(collection:viewModel.collection)
    }
    
    private func validateCollection(collection:LandingViewModelCollection) {
        let sections:Int = collection.sections.count
        XCTAssertEqual(self.project.columns.count, sections, "Invalid number of sections")
        for index:Int in 0 ..< sections {
            let section:LandingViewModelCollectionSection = collection.sections[index]
            let column:ProjectColumn = self.project.columns[index]
            self.validateSection(section:section, column:column)
        }
    }
    
    private func validateSection(section:LandingViewModelCollectionSection, column:ProjectColumn) {
        XCTAssertEqual(section.title, column.name, "Failed to assign section title")
    }
}
