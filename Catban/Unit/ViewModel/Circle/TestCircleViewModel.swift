import XCTest
@testable import catban

class TestCircleViewModel:XCTestCase {
    private var viewModel:CircleViewModel!
    
    override func setUp() {
        super.setUp()
        self.viewModel = CircleViewModel()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.viewModel.fillColour, "Failed to load colour")
        XCTAssertNotNil(self.viewModel.startAngle, "Failed to load angle")
        XCTAssertNotNil(self.viewModel.endAngle, "Failed to load angle")
        XCTAssertNotNil(self.viewModel.subtractRadius, "Failed to load substract radius")
    }
    
    func testPercentToRadian() {
        let wholeCircle:CGFloat = CircleViewModel.percentToRadians(percent:1)
        let halfCircle:CGFloat = CircleViewModel.percentToRadians(percent:0.5)
        XCTAssertEqual(wholeCircle, CircleViewModel.Constants.circleRadians, "Failed to get radians")
        XCTAssertEqual(halfCircle, CircleViewModel.Constants.circleRadians / 2.0, "Failed to get radians")
    }
}
