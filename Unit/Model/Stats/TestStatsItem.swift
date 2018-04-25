import XCTest
@testable import catban

class TestStatsItem:XCTestCase {
    private var model:MockStatsItemProtocol!
    private var project:Project!
    
    override func setUp() {
        super.setUp()
        self.model = MockStatsItemProtocol()
        self.project = Project()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testFactoryViewModel() {
        let viewModel:StatsViewModelCollectionItemProtocol =  self.model.factoryViewModelWith(project:self.project)
        XCTAssertNotNil(viewModel, "Failed to create view model")
    }
}
