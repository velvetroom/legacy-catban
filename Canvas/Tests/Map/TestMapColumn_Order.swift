import XCTest
@testable import Canvas

class TestMapColumn_Order:XCTestCase {
    private var model:MapColumn!
    private var view:MockViewNode!
    private var item:MockMapCardProtocol!
    private var layout:NSLayoutConstraint!
    
    override func setUp() {
        super.setUp()
        self.model = MapColumn()
        self.item = MockMapCardProtocol()
        self.view = MockViewNode()
        self.layout = NSLayoutConstraint()
        self.model.view = self.view
        self.view.layoutTop = self.layout
        self.view.layoutLeft = self.layout
        self.view.layoutWidth = self.layout
        self.view.layoutHeight = self.layout
    }
    
    func testOrderNoItems() {
        self.model.order(item:self.item)
        XCTAssertNotNil(self.model.childItem, "Not added")
    }
    
    func testOrderPushingChilds() {
        let child:MockMapCardProtocol = MockMapCardProtocol()
        child.minY = 200
        self.item.minY = 100
        self.model.childItem = child
        child.parent = self.model
        self.model.order(item:self.item)
        XCTAssertTrue(self.item.childItem === child, "Not pushing")
    }
    
    func testOrderAppending() {
        let child:MockMapCardProtocol = MockMapCardProtocol()
        child.minY = 100
        self.item.minY = 200
        self.model.childItem = child
        child.parent = self.model
        self.model.order(item:self.item)
        XCTAssertTrue(child.childItem === self.item, "Not appending")
    }
}
