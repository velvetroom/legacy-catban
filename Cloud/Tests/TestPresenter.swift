import XCTest
import Board
import Shared
@testable import Cloud

class TestPresenter:XCTestCase {
    private var view:Cloud.View!
    private var board:BoardProtocol!
    private var project:ProjectProtocol!
    private var transition:MockTransitionProtocol!
    private var interactor:MockInteractor!
    
    override func setUp() {
        super.setUp()
        Configuration.repositoryProjectType = MockRepositoryProjectProtocol.self
        self.view = Cloud.View()
        self.board = BoardFactory.newBoard()
        self.project = ProjectFactory.newProject()
        self.transition = MockTransitionProtocol()
        self.interactor = MockInteractor()
        self.project.name = "lorem ipsum"
        self.view.presenter.interactor = self.interactor
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
        self.view.selectorDone()
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
    
    func testCallsInteractorOnStart() {
        var called:Bool = false
        self.interactor.onStart = { called = true }
        self.view.presenter.start()
        XCTAssertTrue(called, "Not called")
    }
    
    func testUpdateViewModelWithError() {
        var ready:Bool = false
        let expect:XCTestExpectation = self.expectation(description:"View model not updated")
        var viewModel:ViewModelContent = self.view.viewModel.property()
        viewModel.observing = { (property:ViewModelContent) in
            if ready {
                XCTAssertFalse(property.buttonContinueHidden, "Should be visible")
                expect.fulfill()
            }
        }
        self.view.viewModel.update(property:viewModel)
        self.interactor.error = NSError(domain:String(), code:0, userInfo:nil)
        ready = true
        self.view.presenter.start()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testUpdateViewModelSuccess() {
        var ready:Bool = false
        let expect:XCTestExpectation = self.expectation(description:"View model not updated")
        var viewModel:ViewModelContent = self.view.viewModel.property()
        viewModel.observing = { (property:ViewModelContent) in
            if ready {
                XCTAssertTrue(property.buttonContinueHidden, "Should not be visible")
                expect.fulfill()
            }
        }
        self.view.viewModel.update(property:viewModel)
        ready = true
        self.view.presenter.start()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
}
