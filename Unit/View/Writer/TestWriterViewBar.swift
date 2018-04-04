import XCTest
@testable import catban

class TestWriterViewBar:XCTestCase {
    private var view:WriterViewBar!
    
    override func setUp() {
        super.setUp()
        self.view = WriterViewBar()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
}
