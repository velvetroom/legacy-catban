import XCTest
@testable import Cloud

class TestPresenter:XCTestCase {
    private var view:Cloud.View!
    
    override func setUp() {
        super.setUp()
        self.view = Cloud.View()
    }
    
    func testNotRetainingTransition() {
        self.view.presenter.transition = MockTransitionProtocol()
        XCTAssertNil(self.view.presenter.transition, "Retains")
    }
}
