import XCTest
@testable import Canvas

class TestViewItemMapable:XCTestCase {
    private var view:ViewItemMapable!
    
    override func setUp() {
        super.setUp()
        self.view = ViewItemMapable()
    }
    
    func testNotRetainingMapItem() {
        self.view.mapItem = MockMapItemProtocol()
        XCTAssertNil(self.view.mapItem, "Retaining")
    }
}
