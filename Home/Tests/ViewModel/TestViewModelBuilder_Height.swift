import XCTest
@testable import Home
@testable import Board

class TestViewModelBuilder_Height:XCTestCase {
    private var builder:ViewModelBuilder!
    private var project:ProjectManagedProtocol!
    private var viewModel:ViewModel!
    private var windowHeight:CGFloat {
        get {
            return max(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
        }
    }
    
    override func setUp() {
        super.setUp()
        let board:BoardProtocol = BoardFactory.newBoard()
        let project:ProjectProtocol = ProjectFactory.newProject()
        let managed:ProjectManagedProtocol = board.manage(project:project)
        self.project = managed
        self.builder = ViewModelBuilder()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.builder, "Failed to load builder")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testUseWindowHeight() {
        self.configureProject()
        XCTAssertEqual(viewModel.scroll.contentSize.height, self.windowHeight, "Failed to assign expected height")
    }
    
    func testUseColumnsHeight() {
        self.addColumns()
        self.configureProject()
        XCTAssertGreaterThan(viewModel.scroll.contentSize.height, self.windowHeight,
                             "Failed to assign column height")
    }
    
    private func configureProject() {
        self.builder.project = self.project
        self.viewModel = builder.buildViewModel()
    }
    
    private func addColumns() {
        let column:ColumnProtocol = ColumnFactory.newColumn()
        for _:Int in 0 ..< 30 {
            column.add(card:CardFactory.newCard())
        }
        self.project.add(column:column)
    }
}
