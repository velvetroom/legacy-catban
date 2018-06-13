import XCTest
import Board
@testable import Projects

class TestViewModelLoader:XCTestCase {
    private var loader:ViewModelLoader!
    private var board:MockBoardProjectsProtocol!
    
    override func setUp() {
        super.setUp()
        self.loader = ViewModelLoader()
        self.board = MockBoardProjectsProtocol()
        self.loader.board = self.board
    }
    
    func testNotRetainingBoard() {
        self.loader.board = MockBoardProjectsProtocol()
        XCTAssertNil(self.loader.board, "Retains")
    }
    
    func testLoadViewModelWithProjects() {
        self.board.projects.append(ProjectFactory.newProject())
        self.loader.load()
        let viewModel:ViewModelList? = self.loader.viewModel as? ViewModelList
        XCTAssertNotNil(viewModel, "Invalid view model type")
    }
    
    func testListItems() {
        let nameA:String = "a lorem ipsum"
        let nameB:String = "b hello world"
        let projectA:ProjectProtocol = ProjectFactory.newProject()
        projectA.name = nameA
        let projectB:ProjectProtocol = ProjectFactory.newProject()
        projectB.name = nameB
        self.board.projects = [projectA, projectB]
        
        self.loader.load()
        let viewModel:ViewModelList = self.loader.viewModel as! ViewModelList
        XCTAssertEqual(viewModel.items.count, 2, "Invalid items")
        XCTAssertEqual(viewModel.items[0].name, nameA, "Invalid value")
        XCTAssertEqual(viewModel.items[0].identifier, projectA.identifier, "Invalid value")
        XCTAssertEqual(viewModel.items[1].name, nameB, "Invalid value")
        XCTAssertEqual(viewModel.items[1].identifier, projectB.identifier, "Invalid value")
    }
    
    func testNoItems() {
        self.loader.load()
        let viewModel:ViewModelEmpty? = self.loader.viewModel as? ViewModelEmpty
        XCTAssertNotNil(viewModel, "Invalid view model type")
    }
    
    func testSortItems() {
        let projectA:ProjectProtocol = ProjectFactory.newProject()
        projectA.name = "A"
        let projectB:ProjectProtocol = ProjectFactory.newProject()
        projectB.name = "B"
        let projectC:ProjectProtocol = ProjectFactory.newProject()
        projectC.name = "C"
        self.board.projects = [projectB, projectC, projectA]
        
        self.loader.load()
        let viewModel:ViewModelList = self.loader.viewModel as! ViewModelList
        XCTAssertEqual(viewModel.items[0].identifier, projectA.identifier, "Invalid order")
        XCTAssertEqual(viewModel.items[1].identifier, projectB.identifier, "Invalid order")
        XCTAssertEqual(viewModel.items[2].identifier, projectC.identifier, "Invalid order")
    }
}
