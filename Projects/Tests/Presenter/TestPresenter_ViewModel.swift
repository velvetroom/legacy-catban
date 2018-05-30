import XCTest
import Board
@testable import Projects

class TestPresenter_ViewModel:XCTestCase {
    private var presenter:Presenter!
    private var board:MockBoardProjectsProtocol!
    private var controller:Controller!
    private var viewList:ViewList!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.board = MockBoardProjectsProtocol()
        self.controller = Controller()
        self.viewList = ViewList()
        self.controller.board = self.board
        self.presenter.controller = self.controller
        self.presenter.outlets.list = self.viewList
        self.presenter.list.view = self.viewList
    }
    
    func testShouldUpdateRefreshesViewModelWithNoProjects() {
        self.presenter.shouldUpdate()
        XCTAssertTrue(self.viewList.isHidden, "Should be hidden")
    }
    
    func testShouldUpdateRefreshesViewModelWithProjects() {
        self.board.projects.append(ProjectFactory.newProject())
        self.presenter.shouldUpdate()
        XCTAssertFalse(self.viewList.isHidden, "Should NOT be hidden")
    }
}
