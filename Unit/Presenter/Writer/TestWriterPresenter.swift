import XCTest
@testable import catban

class TestWriterPresenter:XCTestCase {
    private var presenter:WriterPresenter!
    
    override func setUp() {
        super.setUp()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
}
