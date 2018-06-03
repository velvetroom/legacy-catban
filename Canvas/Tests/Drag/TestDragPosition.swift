import XCTest
@testable import Canvas

class TestDragPosition:XCTestCase {
    private var model:DragPosition!
    
    override func setUp() {
        super.setUp()
        self.model = DragPosition()
    }
    
    func testUpdate() {
        let touch:CGPoint = CGPoint(x:100, y:200)
        self.model.latestTouch = touch
        
        let updated:CGPoint = self.model.updatedPosition
        XCTAssertEqual(updated.x, touch.x, "Not updated")
        XCTAssertEqual(updated.y, touch.y, "Not updated")
    }
}
