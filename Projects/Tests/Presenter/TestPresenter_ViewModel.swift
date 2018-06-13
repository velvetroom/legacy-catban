import XCTest
import Board
@testable import Projects

class TestPresenter_ViewModel:XCTestCase {
    private var view:View!
    private var presenter:Presenter!
    private var board:MockBoardProjectsProtocol!
    private var viewList:ViewList!
    
    override func setUp() {
        super.setUp()
        self.view = View()
        self.presenter = self.view.presenter
        self.board = MockBoardProjectsProtocol()
        self.viewList = self.view.content.viewList
        self.presenter.interactor.board = self.board
        self.presenter.list.view = self.viewList
    }
    
    func testNotRetainingView() {
        let presenter:Presenter = self.presenter
        presenter.presenting = View()
        XCTAssertNil(presenter.presenting, "Retains")
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
