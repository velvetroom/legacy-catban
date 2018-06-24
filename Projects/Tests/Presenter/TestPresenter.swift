import XCTest
@testable import Projects

class TestPresenter:XCTestCase {
    private var view:Projects.View!
    private var interactor:MockInteractor!
    private var board:MockBoardProjectsProtocol!
    private var project:MockProjectManagedProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = Projects.View()
        self.interactor = MockInteractor()
        self.board = MockBoardProjectsProtocol()
        self.project = MockProjectManagedProtocol()
        self.board.project = self.project
        self.view.presenter.interactor = self.interactor
        self.view.presenter.state.selected = String()
        self.interactor.board = self.board
    }
    
    func testRenameChangesStatus() {
        self.view.presenter.rename()
        let state:StateRename? = self.interactor.state as? StateRename
        XCTAssertNotNil(state, "Invalid state")
    }
    
    func testOpenProjectCallsInteractor() {
        var called:Bool = false
        self.interactor.onOpenProject = { called = true }
        self.view.presenter.openProject()
        XCTAssertTrue(called, "Not called")
    }
    
    func testAddProjectChangesStatus() {
        self.view.presenter.addProject()
        let state:StateAdd? = self.interactor.state as? StateAdd
        XCTAssertNotNil(state, "Invalid state")
    }
    
    func testDeleteChangesStatus() {
        self.view.presenter.delete()
        let state:StateDelete? = self.interactor.state as? StateDelete
        XCTAssertNotNil(state, "Invalid state")
    }
}
