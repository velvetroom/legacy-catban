import XCTest
import Board
@testable import Cloud

class TestPresenter:XCTestCase {
    private var view:Cloud.View!
    private var board:BoardProtocol!
    private var project:ProjectProtocol!
    private var transition:MockTransitionProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = Cloud.View()
        self.board = BoardFactory.newBoard()
        self.project = ProjectFactory.newProject()
        self.transition = MockTransitionProtocol()
        self.view.presenter.interactor.board = self.board
        self.view.presenter.interactor.project = self.project
        self.view.transition = self.transition
    }
    
    func testNotRetainingTransition() {
        self.view.presenter.transition = MockTransitionProtocol()
        XCTAssertNil(self.view.presenter.transition, "Retains")
    }
    
    func testUpdatesViewModelProject() {
        var updated:Bool = false
        var receivedProjectName:String = String()
        self.project.name = "hello world"
        var viewModel:ViewModelProject = self.view.viewModel.property()
        viewModel.observing = { (property:ViewModelProject) in
            receivedProjectName = property.projectName
            updated = true
        }
        self.view.viewModel.update(property:viewModel)
        self.view.presenter.didLoad()
        XCTAssertTrue(updated, "Not updated")
        XCTAssertEqual(receivedProjectName, self.project.name, "Invalid name")
    }
    
    func testDoneTransitionsToHome() {
        var transitioned:Bool = false
        self.transition.onTransitionToHome = { transitioned = true }
        self.view.presenter.done()
        XCTAssertTrue(transitioned, "Failed to transition")
    }
}
