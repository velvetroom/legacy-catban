import XCTest
@testable import Canvas

class TestViewItemMapable:XCTestCase {
    private var view:ViewItemMapable!
    private var mapItem:MockMapItemProtocol!
    private var parent:MockMapParentProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = ViewItemMapable()
        self.mapItem = MockMapItemProtocol()
        self.parent = MockMapParentProtocol()
        self.view.mapItem = self.mapItem
        self.mapItem.parent = self.parent
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
        
        self.view.stateMoving()
        XCTAssertTrue(called, "Not called")
    }
}
