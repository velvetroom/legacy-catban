import XCTest
@testable import Projects

class TestViewList:XCTestCase {
    private var view:ViewList!
    
    override func setUp() {
        super.setUp()
        self.view = ViewList()
    }
    
    func testSimulateScrollOnUpdateSelector() {
        var called:Bool = false
        let delegate:MockCollectionViewDelegate = MockCollectionViewDelegate()
        self.view.delegate = delegate
        delegate.onScrollDidScroll = { called = true }
        self.view.updateSelector()
        XCTAssertTrue(called, "No called")
    }
}
