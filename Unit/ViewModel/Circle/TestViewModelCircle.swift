import XCTest
@testable import catban

class TestViewModelCircle:XCTestCase {
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
        XCTAssertNotNil(self.viewModel.startAngle, "Failed to load angle")
    }
}
