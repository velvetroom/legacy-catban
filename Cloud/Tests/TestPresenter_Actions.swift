import XCTest
import Board
@testable import Cloud

class TestPresenter_Actions:XCTestCase {
    private var view:Cloud.View!
    private var interactor:MockInteractor!
    private var project:ProjectProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = Cloud.View()
        self.interactor = MockInteractor()
        self.project = ProjectFactory.newProject()
        self.view.presenter.interactor = self.interactor
        self.interactor.project = self.project
    }
    
    func testSaveCallsInteractor() {
        var called:Bool = false
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
        self.view.presenter.save()
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
}
