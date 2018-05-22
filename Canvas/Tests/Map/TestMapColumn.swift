import XCTest
@testable import Canvas

class TestMapColumn:XCTestCase {
    private var model:MapColumn!
    private var view:MockViewItem!
    private var layout:NSLayoutConstraint!
    
    override func setUp() {
        super.setUp()
        self.model = MapColumn()
        self.view = MockViewItem()
        self.layout = NSLayoutConstraint()
        self.model.view = self.view
        self.view.layoutTop = self.layout
        self.view.layoutHeight = self.layout
        self.view.layoutLeft = self.layout
        self.view.layoutWidth = self.layout
    }
    
    func testNotRetainingView() {
        self.model.view = MockViewItem()
        XCTAssertNil(self.model.view, "Retains")
    }
    
    func testNotRetainingChild() {
        self.model.childItem = MockMapItemProtocol()
        XCTAssertNil(self.model.childItem, "Retains")
    }
    
    func testAddItemWithNoChilds() {
        let item:MockMapItemProtocol = MockMapItemProtocol()
        self.model.add(item:item)
        XCTAssertNotNil(self.model.childItem, "Not added")
    }
    
    func testAddItemWithChild() {
        let child:MockMapCardProtocol = MockMapCardProtocol()
        self.model.childItem = child
        self.model.add(item:MockMapItemProtocol())
        
        XCTAssertNotNil(child.childItem, "Not added")
    }
    
    func testHeightNoItems() {
        let expected:CGFloat = Constants.ColumnTitle.height + Constants.Column.paddingBottom
        XCTAssertEqual(self.model.height, expected, "Invalid height")
    }
    
    func testHeightWithItem() {
        let itemY:CGFloat = 456
        let item:MockMapItemProtocol = MockMapItemProtocol()
        item.maxY = itemY
        self.model.childItem = item
        let expected:CGFloat = Constants.Column.paddingBottom + itemY
        
        XCTAssertEqual(self.model.height, expected, "Invalid height")
    }
}
