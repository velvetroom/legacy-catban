import XCTest
@testable import Shared

class TestView:XCTestCase {
    private var view:View!
    private var delegate:MockViewDelegateProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = View()
        self.delegate = MockViewDelegateProtocol()
        self.view.delegate = self.delegate
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.delegate, "Failed to load delegate")
    }
    
    func testViewDidLoad() {
        var delegateCalled:Bool = false
        self.delegate.onViewDidLoad = {
            delegateCalled = false
        }
        XCTAssertNotNil(self.view.view, "Failed to load view")
        XCTAssertFalse(delegateCalled, "Delegate is not called")
    }
}
