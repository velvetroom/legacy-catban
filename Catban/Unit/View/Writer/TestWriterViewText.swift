import XCTest
@testable import catban

class TestWriterViewText:XCTestCase {
    private var view:WriterViewText!
    
    override func setUp() {
        super.setUp()
        self.view = WriterViewText()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
}
