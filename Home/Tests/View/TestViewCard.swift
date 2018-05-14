import XCTest
@testable import Home
@testable import Board

class TestViewCard:XCTestCase {
    private var view:ViewCard!
    private var controller:MockController!
    
    override func setUp() {
        super.setUp()
        self.view = ViewCard()
        self.controller = MockController()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testProperties() {
        XCTAssertNotNil(self.view.labelContent, "Failed to load property")
        XCTAssertNil(self.view.layoutLeft, "Property not found")
        XCTAssertNil(self.view.layoutTop, "Property not found")
        XCTAssertNil(self.view.layoutHeight, "Property not found")
        XCTAssertNil(self.view.layoutWidth, "Property not found")
    }
}
