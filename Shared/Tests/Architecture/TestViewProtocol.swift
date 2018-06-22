import XCTest
@testable import Shared

class TestViewProtocol:XCTestCase {
    private var view:MockView!
    
    override func setUp() {
        super.setUp()
        self.view = MockView()
    }
    
    func testReturnsSelfAsViewController() {
        XCTAssertEqual(self.view, self.view.viewController, "Not returning self")
    }
}
