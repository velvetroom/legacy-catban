import XCTest
import Board
@testable import Projects

class TestPresenterViewModelLoader:XCTestCase {
    private var presenter:PresenterViewModelLoader!
    private var board:MockBoardProjectsProtocol!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterViewModelLoader()
        self.board = MockBoardProjectsProtocol()
        self.presenter.board = self.board
    }
    
    func testNotRetainingBoard() {
        self.presenter.board = MockBoardProjectsProtocol()
        XCTAssertNil(self.presenter.board, "Retains")
    }
    
    func testLoadViewModelWithProjects() {
        self.board.projects.append(ProjectFactory.newProject())
        self.presenter.load()
        let viewModel:ViewModelList? = self.presenter.viewModel as? ViewModelList
        XCTAssertNotNil(viewModel, "Invalid view model type")
    }
    
    func testListItems() {
        let nameA:String = "lorem ipsum"
        let nameB:String = "hello world"
        let projectA:ProjectProtocol = ProjectFactory.newProject()
        projectA.name = nameA
        let projectB:ProjectProtocol = ProjectFactory.newProject()
        projectB.name = nameB
        self.board.projects = [projectA, projectB]
        
        self.presenter.load()
        let viewModel:ViewModelList = self.presenter.viewModel as! ViewModelList
        XCTAssertEqual(viewModel.items.count, 2, "Invalid items")
        XCTAssertEqual(viewModel.items[0].name, nameA, "Invalid value")
        XCTAssertEqual(viewModel.items[0].identifier, projectA.identifier, "Invalid value")
        XCTAssertEqual(viewModel.items[1].name, nameB, "Invalid value")
        XCTAssertEqual(viewModel.items[1].identifier, projectB.identifier, "Invalid value")
    }
    
    func testNoItems() {
        self.presenter.load()
        let viewModel:ViewModelEmpty? = self.presenter.viewModel as? ViewModelEmpty
        XCTAssertNotNil(viewModel, "Invalid view model type")
    }
}
