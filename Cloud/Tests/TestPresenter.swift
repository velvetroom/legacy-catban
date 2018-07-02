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
        self.project.name = "lorem ipsum"
        self.view.presenter.interactor.board = self.board
        self.view.presenter.interactor.project = self.project
        self.view.transition = self.transition
    }
    
    func testNotRetainingTransition() {
        self.view.presenter.transition = MockTransitionProtocol()
        XCTAssertNil(self.view.presenter.transition, "Retains")
    }
    
    func testDoneTransitionsToHome() {
        var transitioned:Bool = false
        self.transition.onTransitionToHome = { transitioned = true }
        self.view.selectorDone(button:UIBarButtonItem())
        XCTAssertTrue(transitioned, "Failed to transition")
    }
    
    func testUpdateViewModel() {
        XCTAssertNotNil(self.view.view, "Failed loading view")
        XCTAssertEqual(self.view.titleProject.title, self.project.name, "Failed to load")
        XCTAssertNotNil(self.view.content.label.text, "Failed to load")
        XCTAssertNotNil(self.view.content.icon.image, "Failed to load")
        
        if let labelText:String = self.view.content.label.text {
            XCTAssertFalse(labelText.isEmpty, "Failed to load")
        }
    }
}
