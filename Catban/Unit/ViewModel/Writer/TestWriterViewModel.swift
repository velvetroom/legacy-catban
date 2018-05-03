import XCTest
@testable import catban

class TestWriterViewModel:XCTestCase {
    private var viewModel:WriterViewModel!
    
    override func setUp() {
        super.setUp()
        self.viewModel = WriterViewModel()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
}
