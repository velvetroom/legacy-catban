import XCTest
@testable import Home

class TestViewCard:XCTestCase {
    private var view:ViewCard!
    
    override func setUp() {
        super.setUp()
        self.view = ViewCard()
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
        XCTAssertNil(self.view.controller, "Property not found")
    }
    
    func testControllerIsNotRetained() {
        self.view.controller = Controller()
        XCTAssertNil(self.view.controller, "Strong retained controller")
    }
}
