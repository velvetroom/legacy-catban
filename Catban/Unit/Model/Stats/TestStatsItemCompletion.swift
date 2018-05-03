import XCTest
@testable import catban

class TestStatsItemCompletion:XCTestCase {
    private var model:StatsItemCompletion!
    private var project:Project!
    private var column:ProjectColumn!
    private var card:ProjectCard!
    
    override func setUp() {
        super.setUp()
        self.model = StatsItemCompletion()
        self.project = Project()
        self.column = ProjectColumn()
        self.card = ProjectCard()
        self.column.cards.append(self.card)
        self.project.columns.append(self.column)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.column, "Failed to load column")
        XCTAssertNotNil(self.card, "Failed to load card")
    }
    
    func testFactoryView() {
        let view:StatsView? = self.model.factoryViewWith(project:self.project) as? StatsViewCompletion
        XCTAssertNotNil(view, "Invalid view type")
    }
    
    func testFactoryViewWithModel() {
        let view:StatsView = self.model.factoryViewWith(project:self.project) as! StatsViewCompletion
        XCTAssertGreaterThan(view.viewModel.circles.count, 0, "Failed to update view model")
    }
}
