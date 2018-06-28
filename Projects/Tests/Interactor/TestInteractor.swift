import XCTest
import Shared
import Board
@testable import Projects

class TestInteractor:XCTestCase {
    private var view:Projects.View!
    private var interactor:Interactor!
    private var transition:MockTransitionProtocol!
    private var board:MockBoardProtocol!
    private var project:MockProjectProtocol!
    private var state:MockStateProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        self.view = Projects.View()
        self.transition = MockTransitionProtocol()
        self.board = MockBoardProtocol()
        self.project = MockProjectProtocol()
        self.state = MockStateProtocol()
        self.board.project = self.project
        self.interactor = self.view.presenter.interactor
        self.interactor.board = self.board
        self.interactor.state = self.state
        self.view.transition = self.transition
    }
    
    func testInitialStateIsDefault() {
        let interactor:Interactor = Interactor()
        let state:StateDefault? = interactor.state as? StateDefault
        XCTAssertNotNil(state, "Invalid state")
    }
    
    func testOpenProject() {
        var transitioned:Bool = false
        self.transition.onTransitionToHome = { transitioned = true }
        self.interactor.openProjectWith(identifier:String())
        XCTAssertTrue(transitioned, "Failed")
    }
    
    func testDeleteCallsState() {
        var removed:Bool = false
        self.interactor.board = board
        self.state.onDeleteConfirmed = { removed = true }
        self.interactor.deleteConfirmed()
        XCTAssertTrue(removed, "Not removed")
    }
    
    func testUpdateSavesProject() {
        var called:Bool = false
        MockRepositoryProjectProtocol.onSave = { called = true }
        self.interactor.updated(project:self.project)
        XCTAssertTrue(called, "Failed to save")
    }
    
    func testAddProjectsAddsItToBoard() {
        var added:Bool = false
        let project:MockProjectProtocol = MockProjectProtocol()
        self.board.onAddProject = { added = true }
        self.interactor.add(project:project)
        XCTAssertTrue(added, "Not added")
    }
    
    func testAddProjectSaves() {
        var added:Bool = false
        let project:MockProjectProtocol = MockProjectProtocol()
        MockRepositoryProjectProtocol.onSave = { added = true }
        self.interactor.add(project:project)
        XCTAssertTrue(added, "Not added")
    }
    
    func testDeleteRemovesProject() {
        var removed:Bool = false
        let project:MockProjectProtocol = MockProjectProtocol()
        self.board.onRemoveProject = { removed = true }
        self.interactor.delete(project:project)
        XCTAssertTrue(removed, "Not removed")
    }
    
    func testDeleteRemovesFromRepository() {
        var removed:Bool = false
        let project:MockProjectProtocol = MockProjectProtocol()
        MockRepositoryProjectProtocol.onDelete = { removed = true }
        self.interactor.delete(project:project)
        XCTAssertTrue(removed, "Not removed")
    }
    
    func testDeleteUpdatesPresenter() {
        var updated:Bool = false
        let presenter:MockPresenter = MockPresenter()
        self.interactor.presenter = presenter
        let project:MockProjectProtocol = MockProjectProtocol()
        presenter.onShouldUpdate = { updated = true }
        self.interactor.delete(project:project)
        XCTAssertTrue(updated, "Not updated")
    }
    
    func testRetainsBoard() {
        self.interactor.board = BoardFactory.newBoard()
        XCTAssertNotNil(self.interactor.board, "Not retaining")
    }
}
