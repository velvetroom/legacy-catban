import XCTest
@testable import Projects

class TestInteractor_States:XCTestCase {
    private var view:Projects.View!
    private var interactor:Interactor!
    private var board:MockBoardProjectsProtocol!
    private var project:MockProjectManagedProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = Projects.View()
        self.interactor = self.view.presenter.interactor
        self.board = MockBoardProjectsProtocol()
        self.project = MockProjectManagedProtocol()
        self.board.project = self.project
        self.interactor.board = self.board
    }
    
    func testInitialStateIsDefault() {
        let state:StateDefault? = self.interactor.state as? StateDefault
        XCTAssertNotNil(state, "Invalid state")
    }
    
    func testRenameChangesStateToRename() {
        self.view.selectorRename(button:UIBarButtonItem())
        let state:StateRename? = self.interactor.state as? StateRename
        XCTAssertNotNil(state, "Invalid state")
        XCTAssertNotNil(state?.project, "Failed to inject to project to state")
    }
}
