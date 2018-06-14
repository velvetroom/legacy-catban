import XCTest
import Shared
import Board
@testable import Projects

class TestInteractor:XCTestCase {
    private var view:Projects.View!
    private var interactor:Interactor!
    private var transition:MockTransitionProtocol!
    private var board:MockBoardProjectsProtocol!
    private var project:MockProjectManagedProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = Projects.View()
        self.transition = MockTransitionProtocol()
        self.board = MockBoardProjectsProtocol()
        self.project = MockProjectManagedProtocol()
        self.board.project = self.project
        self.interactor = self.view.presenter.interactor
        self.interactor.board = self.board
        self.view.transition = self.transition
    }
    
    func testOpenProject() {
        var transitioned:Bool = false
        self.transition.onTransitionToHome = { transitioned = true }
        self.interactor.openProjectWith(identifier:String())
        XCTAssertTrue(transitioned, "Failed")
    }
    
    func testDeleteRemovesProject() {
        var removed:Bool = false
        self.interactor.board = board
        self.board.onRemoveProject = { removed = true }
        self.interactor.deleteProjectWith(identifier:String())
        XCTAssertTrue(removed, "Not removed")
    }
    
    func testDeleteCallsRepository() {
        var called:Bool = false
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        MockRepositoryProjectProtocol.onDelete = { called = true }
        self.interactor.deleteProjectWith(identifier:String())
        XCTAssertTrue(called, "Failed to delete")
    }
    
    func testUpdateSavesProject() {
        var called:Bool = false
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        MockRepositoryProjectProtocol.onSave = { called = true }
        self.interactor.update(project:String(), with:String())
        XCTAssertTrue(called, "Failed to save")
    }
    
    func testAddSavesProject() {
        var called:Bool = false
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        MockRepositoryProjectProtocol.onSave = { called = true }
        let _:ProjectProtocol = self.interactor.addProject()
        XCTAssertTrue(called, "Failed to save")
    }
}
