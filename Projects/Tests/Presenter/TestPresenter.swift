import XCTest
import Shared
@testable import Projects

class TestPresenter:XCTestCase {
    private var view:Projects.View!
    private var board:MockBoardProjectsProtocol!
    private var project:MockProjectManagedProtocol!
    private var presenter:Presenter!
    private var list:MockPresenterList!
    
    override func setUp() {
        super.setUp()
        self.view = Projects.View()
        self.board = MockBoardProjectsProtocol()
        self.project = MockProjectManagedProtocol()
        self.presenter = self.view.presenter
        self.list = MockPresenterList()
        self.presenter.list = self.list
        self.board.project = self.project
        self.presenter.interactor.board = self.board
    }
    
    func testUpdatesReturnsToSelectedItem() {
        var returns:Bool = false
        self.list.onSelectItemWithIdentifier = { returns = true }
        self.presenter.updateProject(name:String(), for:String())
        XCTAssertTrue(returns, "Not returning")
    }
}
