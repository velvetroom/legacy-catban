import XCTest
import Board
@testable import Cloud

class TestPresenter_Actions:XCTestCase {
    private var view:Cloud.View!
    private var interactor:MockInteractor!
    private var project:ProjectProtocol!
    private var transition:MockTransitionProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = Cloud.View()
        self.interactor = MockInteractor()
        self.project = ProjectFactory.newProject()
        self.transition = MockTransitionProtocol()
        self.view.presenter.interactor = self.interactor
        self.interactor.project = self.project
        self.view.transition = self.transition
    }
    
    func testSaveCallsInteractor() {
        var called:Bool = false
        let project:ProjectSynchedProtocol = ProjectFactory.makeSynchable(project:self.project)
        self.interactor.project = project
        self.interactor.onSave = { called = true }
        self.view.presenter.save()
        XCTAssertTrue(called, "Not called")
    }
    
    func testSaveFailsUpdatesViewModel() {
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
        self.view.presenter.save()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testSaveSuccessUpdatesViewModel() {
        var ready:Bool = false
        let project:ProjectSynchedProtocol = ProjectFactory.makeSynchable(project:self.project)
        self.interactor.project = project
        let expect:XCTestExpectation = self.expectation(description:"View model not updated")
        var viewModel:ViewModelContent = self.view.viewModel.property()
        viewModel.observing = { (property:ViewModelContent) in
            if ready {
                XCTAssertTrue(property.buttonContinueHidden, "Should not be visible")
                XCTAssertTrue(property.buttonStartHidden, "Should not be visible")
                expect.fulfill()
            }
        }
        self.view.viewModel.update(property:viewModel)
        ready = true
        self.view.presenter.save()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testSharePresentsView() {
        var presented:Bool = false
        self.transition.onPresent = { presented = true }
        self.view.presenter.share()
        let view:ViewShare? = self.transition.view as? ViewShare
        XCTAssertTrue(presented, "Failed to present")
        XCTAssertNotNil(view, "Invalid view presented")
        XCTAssertTrue(view?.interactor === self.interactor, "Invalid interactor")
    }
}
