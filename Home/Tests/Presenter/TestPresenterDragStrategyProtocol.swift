import XCTest
@testable import Home

class TestPresenterDragStrategyProtocol:XCTestCase {
    private var strategy:MockPresenterDragStrategyProtocol!
    
    override func setUp() {
        super.setUp()
        self.strategy = MockPresenterDragStrategyProtocol()
    }
    
    func testDeltaPositionNegative() {
        let deltaX:CGFloat = 50
        let deltaY:CGFloat = 50
        self.strategy.latestPosition = CGPoint(x:deltaX, y:deltaY)
        
        let delta:CGPoint = self.strategy.deltaPosition
        XCTAssertEqual(delta.x, -deltaX, "Invalid delta")
        XCTAssertEqual(delta.y, -deltaY, "Invalid delta")
    }
    
    func testDeltaPositionPositive() {
        let deltaX:CGFloat = 33
        let deltaY:CGFloat = -22
        self.strategy.latestPosition = CGPoint(x:deltaX, y:deltaY)
        
        let delta:CGPoint = self.strategy.deltaPosition
        XCTAssertEqual(delta.x, -deltaX, "Invalid delta")
        XCTAssertEqual(delta.y, -deltaY, "Invalid delta")
    }
    
    func testDeltaPositionMixed() {
        let deltaX:CGFloat = 66
        let deltaY:CGFloat = -77
        self.strategy.latestPosition = CGPoint(x:deltaX, y:deltaY)
        
        let delta:CGPoint = self.strategy.deltaPosition
        XCTAssertEqual(delta.x, -deltaX, "Invalid delta")
        XCTAssertEqual(delta.y, -deltaY, "Invalid delta")
    }
    
    func testDeltaDistance() {
        let deltaX:CGFloat = 66
        let deltaY:CGFloat = -77
        let expectedDistance:CGFloat = abs(deltaX) + abs(deltaY)
        self.strategy.latestPosition = CGPoint(x:deltaX, y:deltaY)
        
        XCTAssertEqual(self.strategy.deltaDistance, expectedDistance, "Invalid distance")
    }
    
    func testIsMoving() {
        self.strategy.latestPosition = CGPoint(x:PresenterConstants.Drag.minDeltaForMovement, y:1)
        XCTAssertTrue(self.strategy.isMoving, "Failed to detect movement")
    }
    
    func testNotMovingYet() {
        self.strategy.latestPosition = CGPoint(x:PresenterConstants.Drag.minDeltaForMovement, y:0)
        XCTAssertFalse(self.strategy.isMoving, "Should not move")
    }
    
    func testNotMoving() {
        XCTAssertFalse(self.strategy.isMoving, "Should not move")
    }
}
