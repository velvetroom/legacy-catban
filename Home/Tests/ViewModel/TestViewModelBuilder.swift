import XCTest
@testable import Home
@testable import Board

class TestViewModelBuilder:XCTestCase {
    private var builder:ViewModelBuilder!
    private var project:ProjectManagedProtocol!
    private var viewModel:ViewModel!
    private struct Constants {
        static let projectName:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        let board:BoardProtocol = BoardFactory.newBoard()
        let project:ProjectProtocol = ProjectFactory.newProject()
        let managed:ProjectManagedProtocol = board.manage(project:project)
        self.project = managed
        self.configureProject()
        self.builder = ViewModelBuilder()
        self.builder.project = self.project
        self.viewModel = self.builder.buildViewModel()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.builder, "Failed to load builder")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
    
    func testProperties() {
        XCTAssertEqual(self.viewModel.view.title, Constants.projectName, "Failed to assign project name")
        XCTAssertNotEqual(self.viewModel.scroll.contentSize, CGSize.zero, "Failed to build content size")
        XCTAssertNotEqual(self.viewModel.board.frame, CGRect.zero, "Failed to build board frame")
        XCTAssertFalse(self.viewModel.columns.isEmpty, "Failed to build columns")
        XCTAssertFalse(self.viewModel.cards.isEmpty, "Failed to build cards")
    }
    
    func testColumns() {
        for column:ViewModelColumn in self.viewModel.columns {
            XCTAssertFalse(column.name.isEmpty, "No name")
        }
    }
    
    func testCards() {
        for card:ViewModelCard in self.viewModel.cards {
            XCTAssertFalse(card.content.isEmpty, "No content")
            XCTAssertFalse(card.identifier.isEmpty, "No identifier")
        }
    }
    
    func testNotRetainingProject() {
        self.project = nil
        XCTAssertNil(self.builder.project, "Retaining project")
    }
    
    private func configureProject() {
        let column:ColumnProtocol = ColumnFactory.newColumn()
        column.name = "hello world"
        let card:CardProtocol = CardFactory.newCard()
        card.content = "lorem ipsum"
        column.add(card:card)
        self.project.name = Constants.projectName
        self.project.add(column:column)
    }
}
