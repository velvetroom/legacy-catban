import XCTest
@testable import catban

class TestStatsViewCompletionThirdOrder:XCTestCase {
    private var view:StatsViewCompletionThirdOrder!
    private var project:Project!
    private struct Constants {
        static let numberOfCircles:Int = 3
    }
    
    override func setUp() {
        super.setUp()
        self.view = StatsViewCompletionThirdOrder()
        self.project = Project()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testFactory() {
        let view:StatsViewCompletionThirdOrder = StatsViewCompletionThirdOrder.factoryWith(project:self.project)
        XCTAssertEqual(view.viewModel.circles.count, Constants.numberOfCircles, "Invalid number of circles")
    }
}
