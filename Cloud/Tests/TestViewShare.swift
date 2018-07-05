import XCTest
@testable import Cloud

class TestViewShare:XCTestCase {
    private var view:ViewShare!
    private var transition:MockTransitionProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = ViewShare()
        self.transition = MockTransitionProtocol()
        self.view.transition = self.transition
    }
    
    func testSelectorCloseDimissesView() {
        let expect:XCTestExpectation = self.expectation(description:"View not dismissed")
        self.transition.onDismiss = { expect.fulfill() }
        self.view.selectorClose(button:UIButton())
        self.waitForExpectations(timeout:0.7, handler:nil)
    }
}
