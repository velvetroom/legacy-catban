import XCTest
@testable import catban

class TestCircleViewModelCompletion:XCTestCase {
    private var viewModel:CircleViewModelCompletion!
    private var project:MockProjectProtocol!
    private var backlogColumn:ProjectColumn!
    private var progressColumnA:ProjectColumn!
    private var progressColumnB:ProjectColumn!
    private var doneColumn:ProjectColumn!
    private struct Constants {
        static let totalCards:Int = 7
        static let backlogCards:Int = 1
        static let progressCardsA:Int = 2
        static let progressCardsB:Int = 1
        static let doneCards:Int = 3
    }
    
    override func setUp() {
        super.setUp()
        self.viewModel = CircleViewModelCompletion()
        self.project = MockProjectProtocol()
        self.project.totalCards = Constants.totalCards
        self.backlogColumn = self.columnWith(cards:Constants.backlogCards)
        self.progressColumnA = self.columnWith(cards:Constants.progressCardsA)
        self.progressColumnB = self.columnWith(cards:Constants.progressCardsB)
        self.doneColumn = self.columnWith(cards:Constants.doneCards)
        self.project.columns = [
            self.backlogColumn,
            self.progressColumnA,
            self.progressColumnB,
            self.doneColumn]
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.viewModel.totalCards, "Failed to load property")
        XCTAssertNotNil(self.viewModel.backlog, "Failed to load property")
        XCTAssertNotNil(self.viewModel.progress, "Failed to load property")
        XCTAssertNotNil(self.viewModel.done, "Failed to load property")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.backlogColumn, "Failed to load backlog")
        XCTAssertNotNil(self.progressColumnA, "Failed to load column a")
        XCTAssertNotNil(self.progressColumnB, "Failed to load column b")
        XCTAssertNotNil(self.doneColumn, "Failed to load backlog")
    }
    
    func testFactoryUsesTotalCards() {
        let viewModel:CircleViewModelCompletion = CircleViewModelCompletion.factoryWith(project:self.project)
        XCTAssertEqual(viewModel.totalCards, Constants.totalCards, "Failed to update total cards")
    }
    
    func testFactoryUpdatesWithNoCards() {
        self.project.columns = []
        let viewModel:CircleViewModelCompletion = CircleViewModelCompletion.factoryWith(project:self.project)
        XCTAssertEqual(viewModel.backlog.cards, 0, "Invalid cards")
        XCTAssertEqual(viewModel.progress.cards, 0, "Invalid cards")
        XCTAssertEqual(viewModel.done.cards, 0, "Invalid cards")
    }
    
    func testFactoryUpdatesBacklogCards() {
        let viewModel:CircleViewModelCompletion = CircleViewModelCompletion.factoryWith(project:self.project)
        XCTAssertEqual(viewModel.backlog.cards, Constants.backlogCards, "Failed to update cards")
    }
    
    func testFactoryUpdatesProgressCards() {
        let viewModel:CircleViewModelCompletion = CircleViewModelCompletion.factoryWith(project:self.project)
        XCTAssertEqual(viewModel.progress.cards,
                       Constants.progressCardsA + Constants.progressCardsB, "Failed to update cards")
    }
    
    func testFactoryUpdatesDoneCards() {
        let viewModel:CircleViewModelCompletion = CircleViewModelCompletion.factoryWith(project:self.project)
        XCTAssertEqual(viewModel.done.cards, Constants.doneCards, "Failed to update cards")
    }
    
    func testFactoryOneColumnShouldHaveNoDoneCards() {
        let project:Project = Project()
        let column:ProjectColumn = ProjectColumn()
        let card:ProjectCard = ProjectCard()
        column.cards.append(card)
        project.columns.append(column)
        let viewModel:CircleViewModelCompletion = CircleViewModelCompletion.factoryWith(project:project)
        XCTAssertEqual(viewModel.done.cards, 0, "Failed to exclude done for only one column")
    }
    
    func testCardsPercent() {
        let expected:CGFloat = CGFloat(Constants.doneCards) / CGFloat(Constants.totalCards)
        let viewModel:CircleViewModelCompletionStack = CircleViewModelCompletion.stackFor(
            cards:Constants.doneCards, with:Constants.totalCards)
        XCTAssertEqual(viewModel.percent, expected, "Incorrect percent on view model")
    }
    
    func testCardsRadians() {
        let viewModel:CircleViewModelCompletionStack = CircleViewModelCompletion.stackFor(
            cards:Constants.doneCards, with:Constants.totalCards)
        let expected:CGFloat = CircleViewModel.percentToRadians(percent:viewModel.percent)
        XCTAssertEqual(viewModel.radians, expected, "Incorrect radians on view model")
    }
    
    private func columnWith(cards:Int) -> ProjectColumn {
        let column:ProjectColumn = ProjectColumn()
        for _:Int in 0 ..< cards {
            column.cards.append(ProjectCard())
        }
        return column
    }
}
