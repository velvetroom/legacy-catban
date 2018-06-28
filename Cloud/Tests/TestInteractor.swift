import XCTest
import Board
@testable import Cloud

class TestInteractor:XCTestCase {
    private var view:Cloud.View!
    
    override func setUp() {
        super.setUp()
        self.view = Cloud.View()
    }
    
    func testNotRetainingPresenter() {
        self.view.presenter.interactor.presenter = Presenter()
        XCTAssertNil(self.view.presenter.interactor.presenter, "Retains")
    }
    
    func testNotRetainingProject() {
        self.view.presenter.interactor.project = ProjectFactory.newProject()
        XCTAssertNil(self.view.presenter.interactor.project, "Retains")
    }
    
    func testRetainingBoard() {
        self.view.presenter.interactor.board = BoardFactory.newBoard()
        XCTAssertNotNil(self.view.presenter.interactor.board, "Retains")
    }
}
