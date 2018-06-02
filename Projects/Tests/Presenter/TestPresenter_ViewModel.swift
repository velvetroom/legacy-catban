import XCTest
import Board
@testable import Projects

class TestPresenter_ViewModel:XCTestCase {
    private var presenter:Presenter!
    private var board:MockBoardProjectsProtocol!
    private var controller:Controller!
    private var viewList:ViewList!
    private var viewSelector:ViewListSelector!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.board = MockBoardProjectsProtocol()
        self.controller = Controller()
        self.viewList = ViewList()
        self.viewSelector = ViewListSelector()
        self.controller.board = self.board
        self.presenter.controller = self.controller
        self.presenter.outlets.list = self.viewList
        self.presenter.outlets.selector = self.viewSelector
        self.presenter.list.view = self.viewList
    }
    
    func testShouldUpdateRefreshesViewModelWithNoProjects() {
        self.presenter.shouldUpdate()
        XCTAssertTrue(self.viewList.isHidden, "Should be hidden")
        XCTAssertTrue(self.viewSelector.isHidden, "Should be hidden")
    }
    
    func testShouldUpdateRefreshesViewModelWithProjects() {
        self.board.projects.append(ProjectFactory.newProject())
        self.presenter.shouldUpdate()
        XCTAssertFalse(self.viewList.isHidden, "Should NOT be hidden")
        XCTAssertFalse(self.viewSelector.isHidden, "Should NOT be hidden")
    }
}
