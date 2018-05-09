import XCTest
@testable import Home

class TestViewColumn:XCTestCase {
    private var view:ViewColumn!
    
    override func setUp() {
        super.setUp()
        self.view = ViewColumn()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testProperties() {
        XCTAssertNil(self.view.layoutLeft, "Property not found")
        XCTAssertNotNil(self.view.labelName, "Failed to load label title")
    }
}
