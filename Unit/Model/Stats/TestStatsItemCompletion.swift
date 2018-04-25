import XCTest
@testable import catban

class TestStatsItemCompletion:XCTestCase {
    private var model:StatsItemCompletion!
    private var project:Project!
    private struct Constants {
        static let minColumns:Int = 0
        static let maxColumns:Int = 33
        static let columnsFirstOrder:Int = 1
        static let columnsSecondOrder:Int = 2
        static let columnsThirdOrder:Int = 3
    }
    
    override func setUp() {
        super.setUp()
        self.model = StatsItemCompletion()
        self.project = Project()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testViewType() {
        let view:StatsView? = self.model.factoryViewWith(
            project:self.project) as? StatsViewCompletion
        XCTAssertNotNil(view, "Invalid view type")
    }
    
    func testViewMinColumns() {
        self.configureProjectWith(columns:Constants.minColumns)
        let view:StatsView? = self.model.factoryViewWith(
            project:self.project) as? StatsViewCompletionFirstOrder
        XCTAssertNotNil(view, "Invalid view type")
    }
    
    func testViewMaxColumns() {
        self.configureProjectWith(columns:Constants.maxColumns)
        let view:StatsView? = self.model.factoryViewWith(
            project:self.project) as? StatsViewCompletionThirdOrder
        XCTAssertNotNil(view, "Invalid view type")
    }
    
    func testViewFirstOrder() {
        self.configureProjectWith(columns:Constants.columnsFirstOrder)
        let view:StatsView? = self.model.factoryViewWith(
            project:self.project) as? StatsViewCompletionFirstOrder
        XCTAssertNotNil(view, "Invalid view type")
    }
    
    func testViewSecondOrder() {
        self.configureProjectWith(columns:Constants.columnsSecondOrder)
        let view:StatsView? = self.model.factoryViewWith(
            project:self.project) as? StatsViewCompletionSecondOrder
        XCTAssertNotNil(view, "Invalid view type")
    }
    
    func testViewThirdOrder() {
        self.configureProjectWith(columns:Constants.columnsThirdOrder)
        let view:StatsView? = self.model.factoryViewWith(
            project:self.project) as? StatsViewCompletionThirdOrder
        XCTAssertNotNil(view, "Invalid view type")
    }
    
    private func configureProjectWith(columns:Int) {
        for _:Int in 0 ..<  columns {
            self.project.columns.append(ProjectColumn())
        }
    }
}
