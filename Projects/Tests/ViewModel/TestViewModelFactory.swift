import XCTest
import Board
@testable import Projects

class TestViewModelFactory:XCTestCase {
    private var board:MockBoardProjectsProtocol!
    
    override func setUp() {
        super.setUp()
        self.board = MockBoardProjectsProtocol()
    }
    
    func testViewModelWithProjects() {
        self.board.projects.append(ProjectFactory.newProject())
        let viewModel:ViewModel = ViewModelFactory.makeWith(board:self.board)
        XCTAssertTrue(viewModel.emptyHidden, "Should be hidden")
        XCTAssertEqual(viewModel.items.count, 1, "Should have 1 item")
        XCTAssertFalse(viewModel.listHidden, "Should NOT be hidden")
        XCTAssertFalse(viewModel.toolbarHidden, "Should NOT be hidden")
        XCTAssertFalse(viewModel.navigationbarHidden, "Should NOT be hidden")
    }
    
    func testListItems() {
        let nameA:String = "a lorem ipsum"
        let nameB:String = "b hello world"
        let projectA:ProjectProtocol = ProjectFactory.newProject()
        projectA.name = nameA
        let projectB:ProjectProtocol = ProjectFactory.newProject()
        projectB.name = nameB
        self.board.projects = [projectA, projectB]
        
        let viewModel:ViewModel = ViewModelFactory.makeWith(board:self.board)
        XCTAssertEqual(viewModel.items.count, 2, "Invalid items")
        XCTAssertEqual(viewModel.items[0].name, nameA, "Invalid value")
        XCTAssertEqual(viewModel.items[0].identifier, projectA.identifier, "Invalid value")
        XCTAssertEqual(viewModel.items[1].name, nameB, "Invalid value")
        XCTAssertEqual(viewModel.items[1].identifier, projectB.identifier, "Invalid value")
    }
    
    func testViewModelWithNoItems() {
        let viewModel:ViewModel = ViewModelFactory.makeWith(board:self.board)
        XCTAssertFalse(viewModel.emptyHidden, "Should NOT be hidden")
        XCTAssertTrue(viewModel.items.isEmpty, "Should be empty")
        XCTAssertTrue(viewModel.listHidden, "Should be hidden")
        XCTAssertTrue(viewModel.toolbarHidden, "Should be hidden")
        XCTAssertFalse(viewModel.navigationbarHidden, "Should NOT be hidden")
    }
    
    func testSortItems() {
        let projectA:ProjectProtocol = ProjectFactory.newProject()
        projectA.name = "A"
        let projectB:ProjectProtocol = ProjectFactory.newProject()
        projectB.name = "B"
        let projectC:ProjectProtocol = ProjectFactory.newProject()
        projectC.name = "C"
        self.board.projects = [projectB, projectC, projectA]
        
        let viewModel:ViewModel = ViewModelFactory.makeWith(board:self.board)
        XCTAssertEqual(viewModel.items[0].identifier, projectA.identifier, "Invalid order")
        XCTAssertEqual(viewModel.items[1].identifier, projectB.identifier, "Invalid order")
        XCTAssertEqual(viewModel.items[2].identifier, projectC.identifier, "Invalid order")
    }
}
