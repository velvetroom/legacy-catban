import XCTest
@testable import Canvas

class TestDragPosition_Moving:XCTestCase {
    private var model:DragPosition!
    
    override func setUp() {
        super.setUp()
        self.model = DragPosition()
    }
    
    func testIsNotMovingWithNoDifference() {
        self.model.initialTouch = CGPoint.zero
        self.model.latestTouch = CGPoint.zero
        XCTAssertFalse(self.model.isMoving, "Should not be moving")
    }
    
    func testIsNotMovingWithSmallDifference() {
        self.model.initialTouch = CGPoint.zero
        self.model.latestTouch = CGPoint(x:10, y:10)
        XCTAssertFalse(self.model.isMoving, "Should not be moving")
    }
    
    func testIsNotMovingWithSmallDifferenceNegative() {
        self.model.initialTouch = CGPoint.zero
        self.model.latestTouch = CGPoint(x:-10, y:-10)
        XCTAssertFalse(self.model.isMoving, "Should not be moving")
    }
    
    func testIsNotMovingWithSmallDifferenceOpposite() {
        self.model.initialTouch = CGPoint.zero
        self.model.latestTouch = CGPoint(x:-10, y:10)
        XCTAssertFalse(self.model.isMoving, "Should not be moving")
    }
    
    func testIsMovingSameSign() {
        self.model.initialTouch = CGPoint.zero
        self.model.latestTouch = CGPoint(x:20, y:20)
        XCTAssertTrue(self.model.isMoving, "Should be moving")
    }
    
    func testIsMovingX() {
        self.model.initialTouch = CGPoint.zero
        self.model.latestTouch = CGPoint(x:30, y:0)
        XCTAssertTrue(self.model.isMoving, "Should be moving")
    }
    
    func testIsMovingY() {
        self.model.initialTouch = CGPoint.zero
        self.model.latestTouch = CGPoint(x:0, y:30)
        XCTAssertTrue(self.model.isMoving, "Should be moving")
    }
    
    func testIsMovingOpposite() {
        self.model.initialTouch = CGPoint.zero
        self.model.latestTouch = CGPoint(x:-30, y:30)
        XCTAssertTrue(self.model.isMoving, "Should be moving")
    }
    
    func testIsMovingNegative() {
        self.model.initialTouch = CGPoint.zero
        self.model.latestTouch = CGPoint(x:-30, y:-30)
        XCTAssertTrue(self.model.isMoving, "Should be moving")
    }
}
