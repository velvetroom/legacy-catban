import XCTest
@testable import Column

class TestViewInput:XCTestCase {
    private var view:ViewInput!
    
    override func setUp() {
        super.setUp()
        self.view = ViewInput()
    }
    
    func testOutlets() {
        XCTAssertNotNil(self.view.field, "Not loaded")
        XCTAssertNotNil(self.view.doneButton, "Not loaded")
    }
}
