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
    
    func testFactoryView() {
        let view:StatsView =  self.model.factoryViewWith(project:self.project)
        XCTAssertNotNil(view, "Failed to create view")
    }
}
