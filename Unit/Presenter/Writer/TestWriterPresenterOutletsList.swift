import XCTest
@testable import catban

class TestWriterPresenterOutletsList:XCTestCase {
    private var list:WriterPresenterOutletsList!
    
    override func setUp() {
        super.setUp()
        self.list = WriterPresenterOutletsList()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.list, "Failed to load list")
        XCTAssertNil(self.list.viewText, "View text should not be set")
        XCTAssertNil(self.list.viewBar, "View text should not be set")
        XCTAssertNil(self.list.layoutBarBottom, "Layout constraint should not be set")
    }
}
