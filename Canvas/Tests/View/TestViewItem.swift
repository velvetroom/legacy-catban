import XCTest
@testable import Canvas

class TestViewItem:XCTestCase {
    private var view:ViewItem!
    
    override func setUp() {
        super.setUp()
        self.view = ViewItem()
    }
    
    func testNotRetainingMapItem() {
        self.view.mapItem = MockMapItemProtocol()
        XCTAssertNil(self.view.mapItem, "Retaining")
    }
    
    func testBringToFrontCallsSuperView() {
        let superView:MockUIView = MockUIView()
        superView.addSubview(self.view)
        var called:Bool = false
        superView.onBringSubviewToFront = {
            called = true
        }
        
        self.view.bringToFront()
        XCTAssertTrue(called, "Not called")
    }
}
