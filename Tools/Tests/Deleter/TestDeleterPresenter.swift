import XCTest
@testable import Tools

class TestDeleterPresenter:XCTestCase {
    private var interactor:MockDeleterInteractorProtocol!
    private var deleter:DeleterView<MockDeleterInteractorProtocol>!
    
    override func setUp() {
        super.setUp()
        self.interactor = MockDeleterInteractorProtocol()
        self.deleter = DeleterFactory.makeWith(
            interactor:self.interactor, and:DeleterViewModel()) as! DeleterView<MockDeleterInteractorProtocol>
    }
    
    func testConfirmCallsInteractor() {
        var called:Bool = false
        self.interactor.onDeleteConfirmed = { called = true }
        self.deleter.presenter.confirm()
        XCTAssertTrue(called, "Not called")
    }
    
    func testCancelCallsInteractor() {
        var called:Bool = false
        self.interactor.onDeleteCancelled = { called = true }
        self.deleter.presenter.cancel()
        XCTAssertTrue(called, "Not called")
    }
}
