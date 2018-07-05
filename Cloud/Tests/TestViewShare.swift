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
        self.view.selectorClose()
        self.waitForExpectations(timeout:0.7, handler:nil)
    }
    
    func testListenToViewModelUpdates() {
        self.view.didLoad()
        var viewModel:ViewModelQr = self.view.viewModel.property()
        viewModel.image = UIImage()
        self.view.viewModel.update(property:viewModel)
        XCTAssertNotNil(self.view.content.viewImage.image, "Not listening")
    }
}
