import XCTest
@testable import catban

class TestStatsItemCompletion:XCTestCase {
    private var model:StatsItemCompletion!
    private var project:Project!
    
    override func setUp() {
        super.setUp()
        self.model = StatsItemCompletion()
        self.project = Project()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testFactoryView() {
        let view:StatsView? = self.model.factoryViewWith(project:self.project) as? StatsViewCompletion
        XCTAssertNotNil(view, "Invalid view type")
    }
}
