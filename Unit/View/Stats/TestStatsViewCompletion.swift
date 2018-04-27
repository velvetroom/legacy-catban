import XCTest
@testable import catban

class TestStatsViewCompletion:XCTestCase {
    private var view:StatsViewCompletion!
    private var project:Project!
    
    override func setUp() {
        super.setUp()
        self.view = StatsViewCompletion()
        self.project = Project()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.view.radius, "Failed to load radius")
        XCTAssertNotNil(self.view.viewGeneral, "Failed to load general")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testInitialCirclesAreZero() {
        XCTAssertTrue(self.view.viewModel.circles.isEmpty, "Initially circles should be empty")
    }
    
    func testUpdateWithUpdatesCircles() {
        self.view.updateWith(project:self.project)
        XCTAssertFalse(self.view.viewModel.circles.isEmpty, "Failed to update circles")
    }
}
