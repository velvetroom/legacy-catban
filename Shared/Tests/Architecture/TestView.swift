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
    
    func testCallsPresenterOnViewDidLoad() {
        var called:Bool = false
        self.delegate.onDidLoad = { called = true }
        
        self.view.viewDidLoad()
        XCTAssertTrue(called, "Failed to call")
    }
    
    func testCallsPresenterOnViewDidAppear() {
        var called:Bool = false
        self.delegate.onDidAppear = { called = true }
        
        self.view.viewDidAppear(false)
        XCTAssertTrue(called, "Failed to call")
    }
}
