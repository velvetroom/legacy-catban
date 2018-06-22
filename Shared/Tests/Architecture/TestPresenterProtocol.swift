import XCTest
@testable import Shared

class TestPresenterProtocol:XCTestCase {
    private var presenter:MockPresenterProtocol!
    private var view:MockView!
    private var transition:MockTransitionProtocol!
    
    override func setUp() {
        super.setUp()
        self.presenter = MockPresenterProtocol()
        self.view = MockView()
        self.transition = MockTransitionProtocol()
        self.presenter.view = self.view
        self.view.transition = self.transition
    }
    
    func testUsingTransitionFromView() {
        XCTAssertNotNil(self.presenter.transition, "Not using transition from view")
    }
}
