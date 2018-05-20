import XCTest
@testable import Canvas

class TestMapCard:XCTestCase {
    private var model:MapCard!
    
    override func setUp() {
        super.setUp()
        self.model = MapCard()
    }
    
    func testNotRetainingView() {
        self.model.view = MockViewNode()
        XCTAssertNil(self.model.view, "Retains")
    }
    
    func testNotRetainingParent() {
        self.model.parent = MockMapParentProtocol()
        XCTAssertNil(self.model.parent, "Retains")
    }
    
    func testRetainsChild() {
        self.model.childItem = MockMapItemProtocol()
        XCTAssertNotNil(self.model.childItem, "Not retaining")
    }
}
