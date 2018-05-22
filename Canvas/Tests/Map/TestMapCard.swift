import XCTest
@testable import Canvas

class TestMapCard:XCTestCase {
    private var model:MapCard!
    
    override func setUp() {
        super.setUp()
        self.model = MapCard()
    }
    
    func testNotRetainingView() {
        self.model.view = MockViewItem()
        XCTAssertNil(self.model.view, "Retains")
    }
    
    func testNotRetainingParent() {
        self.model.parent = MockMapParentProtocol()
        XCTAssertNil(self.model.parent, "Retains")
    }
    
    func testNotRetainingChild() {
        self.model.childItem = MockMapItemProtocol()
        XCTAssertNil(self.model.childItem, "Retains")
    }
}
