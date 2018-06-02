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
        self.delegate.onDidLoadView = { (view:View) in
            XCTAssertEqual(view, self.view, "Invalid view received")
            delegateCalled = true
        }
        XCTAssertNotNil(self.view.view, "Failed to load view")
        XCTAssertTrue(delegateCalled, "Delegate is not called")
    }
    
    func testViewDidAppear() {
        var delegateCalled:Bool = false
        self.delegate.onDidAppear = { (view:View) in
            XCTAssertEqual(view, self.view, "Invalid view received")
            delegateCalled = true
        }
        self.view.viewDidAppear(false)
        XCTAssertTrue(delegateCalled, "Delegate is not called")
    }
}
