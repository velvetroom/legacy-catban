import XCTest
@testable import catban

class TestStatsViewCompletion:XCTestCase {
    private var view:StatsViewCompletion<MockStatsViewModelCollectionItemCompletionProtocol>!
    private struct Constants {
        static let outerRadius:CGFloat = 324
        static let middleRadius:CGFloat = 565
        static let innerRadius:CGFloat = 9886
    }
    
    override func setUp() {
        super.setUp()
        self.view = StatsViewCompletion()
        self.view.innerCircleRadius = Constants.innerRadius
        self.view.outerCircleRadius = Constants.outerRadius
        self.view.middleCircleRadius = Constants.middleRadius
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.view.outerCircleRadius, "Failed to load radius")
        XCTAssertNotNil(self.view.middleCircleRadius, "Failed to load radius")
        XCTAssertNotNil(self.view.innerCircleRadius, "Failed to load radius")
        XCTAssertNotNil(self.view.viewGeneral, "Failed to load general")
    }
    
    func testInnerCircle() {
        XCTAssertEqual(self.view.getInnerCircleRadius(), Constants.innerRadius, "Invalid radius")
    }
    
    func testMiddleCircle() {
        XCTAssertEqual(self.view.getMiddleCircleRadius(), Constants.middleRadius, "Invalid radius")
    }
    
    func testOuterCircle() {
        XCTAssertEqual(self.view.getOuterCircleRadius(), Constants.outerRadius, "Invalid radius")
    }
}
