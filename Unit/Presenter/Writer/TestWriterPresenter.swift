import XCTest
@testable import catban

class TestWriterPresenter:XCTestCase {
    private var presenter:WriterPresenter!
    
    override func setUp() {
        super.setUp()
        self.presenter = WriterPresenter()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.outlets, "Failed to load outlets")
    }
}
