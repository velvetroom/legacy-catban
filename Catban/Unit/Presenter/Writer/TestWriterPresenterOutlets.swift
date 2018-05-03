import XCTest
@testable import catban

class TestWriterPresenterOutlets:XCTestCase {
    private var presenter:WriterPresenterOutlets!
    
    override func setUp() {
        super.setUp()
        self.presenter = WriterPresenterOutlets()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.list, "Failed to load list")
    }
}
