import XCTest
@testable import Projects

class TestInteractor_Deleter:XCTestCase {
    private var view:Projects.View!
    private var state:MockStateProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = Projects.View()
        self.state = MockStateProtocol()
        self.view.presenter.interactor.state = self.state
    }
    
    func testDeleteConfirmedCallsState() {
        var called:Bool = false
        self.state.onDeleteConfirmed = { called = true }
        self.view.presenter.interactor.deleteConfirmed()
        XCTAssertTrue(called, "Not called")
    }
    
    func testDeleteCancelledChangesToDefault() {
        self.view.presenter.interactor.state = StateDelete()
        self.view.presenter.interactor.deleteCancelled()
        let state:StateDefault? = self.view.presenter.interactor.state as? StateDefault
        XCTAssertNotNil(state, "Invalid state")
    }
    
    func testOpenDeleterCallsState() {
        var called:Bool = false
        self.state.onOpenDeleter = { called = true }
        self.view.presenter.interactor.openDeleter()
        XCTAssertTrue(called, "Not called")
    }
}
