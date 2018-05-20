import XCTest
@testable import Canvas

class TestDragPosition:XCTestCase {
    private var model:DragPosition!
    
    override func setUp() {
        super.setUp()
        self.model = DragPosition()
    }
    
    func testRestart() {
        let itemPosition:CGPoint = CGPoint(x:34, y:45)
        let item:MockMapItemProtocol = MockMapItemProtocol()
        item.minX = itemPosition.x
        item.minY = itemPosition.y
        let touch:CGPoint = CGPoint(x:345, y:678)
        
        self.model.restartWith(item:item, and:touch)
        XCTAssertEqual(self.model.initialItem, itemPosition, "Not updated")
        XCTAssertEqual(self.model.initialTouch, touch, "Not updated")
        XCTAssertEqual(self.model.latestTouch, touch, "Not updated")
    }
    
    func testUpdate() {
        let item:MockMapItemProtocol = MockMapItemProtocol()
        let touch:CGPoint = CGPoint(x:100, y:200)
        self.model.latestTouch = touch
        
        self.model.update(item:item)
        XCTAssertEqual(item.minX, touch.x, "Not updated")
        XCTAssertEqual(item.minY, touch.y, "Not updated")
    }
}
