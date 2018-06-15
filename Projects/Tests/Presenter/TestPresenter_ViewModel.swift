import XCTest
import Board
@testable import Projects

class TestPresenter_ViewModel:XCTestCase {
    private var view:View!
    private var presenter:Presenter!
    private var board:MockBoardProjectsProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = View()
        self.presenter = self.view.presenter
        self.board = MockBoardProjectsProtocol()
        self.presenter.interactor.board = self.board
    }
    
    func testNotRetainingView() {
        let presenter:Presenter = self.presenter
        presenter.presenting = View()
        XCTAssertNil(presenter.presenting, "Retains")
    }
    
    func testShouldUpdateRefreshesViewModelWithProjects() {
        self.board.projects.append(ProjectFactory.newProject())
        self.presenter.shouldUpdate()
        XCTAssertFalse(self.view.content.viewList.isHidden, "Should NOT be hidden")
    }
}
