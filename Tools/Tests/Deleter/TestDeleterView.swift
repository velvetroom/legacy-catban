import XCTest
@testable import Tools

class TestDeleterView:XCTestCase {
    private var interactor:MockDeleterInteractorProtocol!
    private var deleter:DeleterView<MockDeleterInteractorProtocol>!
    private var presenter:MockDeleterPresenter!
    private var transition:MockTransitionProtocol!
    
    override func setUp() {
        super.setUp()
        self.interactor = MockDeleterInteractorProtocol()
        self.deleter = DeleterFactory.makeWith(
            interactor:self.interactor, and:DeleterViewModel()) as! DeleterView<MockDeleterInteractorProtocol>
        self.presenter = MockDeleterPresenter()
        self.transition = MockTransitionProtocol()
        self.deleter.presenter = self.presenter
        self.deleter.transition = self.transition
    }
    
    func testCancelCloseDeleter() {
        let expect:XCTestExpectation = self.expectation(description:String())
        var closed:Bool = false
        self.transition.onDimiss = {
            closed = true
            expect.fulfill()
        }
        self.deleter.selectorCancel(button:UIButton())
        self.waitForExpectations(timeout:0.5) { (error:Error?) in
            XCTAssertTrue(closed, "Failed to close")
        }
    }
    
    func testCancelCallsPresenter() {
        let expect:XCTestExpectation = self.expectation(description:String())
        var closed:Bool = false
        self.presenter.onCancel = {
            closed = true
            expect.fulfill()
        }
        self.deleter.selectorCancel(button:UIButton())
        self.waitForExpectations(timeout:0.5) { (error:Error?) in
            XCTAssertTrue(closed, "Failed to close")
        }
    }
}
