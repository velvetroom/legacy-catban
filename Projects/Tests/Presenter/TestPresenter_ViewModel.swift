import XCTest
import Board
@testable import Projects

class TestPresenter_ViewModel:XCTestCase {
    private var view:View!
    private var presenter:Presenter!
    private var board:MockBoardProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = View()
        self.presenter = self.view.presenter
        self.board = MockBoardProtocol()
        self.presenter.interactor.board = self.board
    }
    
    func testShouldUpdateRefreshesViewModelWithProjects() {
        self.board.projects.append(ProjectFactory.newProject())
        self.presenter.shouldUpdate()
        XCTAssertFalse(self.view.content.viewList.isHidden, "Should NOT be hidden")
    }
}
