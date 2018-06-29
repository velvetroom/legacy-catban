import XCTest
import Board
@testable import Cloud

class TestPresenter:XCTestCase {
    private var view:Cloud.View!
    private var board:BoardProtocol!
    private var project:ProjectProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = Cloud.View()
        self.board = BoardFactory.newBoard()
        self.project = ProjectFactory.newProject()
        self.view.presenter.interactor.board = self.board
        self.view.presenter.interactor.project = self.project
    }
    
    func testNotRetainingTransition() {
        self.view.presenter.transition = MockTransitionProtocol()
        XCTAssertNil(self.view.presenter.transition, "Retains")
    }
    
    func testUpdatesViewModelContent() {
        var updated:Bool = false
        var receivedProjectName:String = String()
        self.project.name = "hello world"
        var viewModel:ViewModelContent = self.view.viewModel.property()
        viewModel.observing = { (property:ViewModelContent) in
            receivedProjectName = property.projectName
            updated = true
        }
        self.view.viewModel.update(property:viewModel)
        self.view.presenter.didLoad()
        XCTAssertTrue(updated, "Not updated")
        XCTAssertEqual(receivedProjectName, self.project.name, "Invalid name")
    }
}
