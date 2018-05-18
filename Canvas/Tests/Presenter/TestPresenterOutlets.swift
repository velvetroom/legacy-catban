import XCTest
@testable import Home

class TestPresenterOutlets:XCTestCase {
    private var presenter:PresenterOutlets!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterOutlets()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
    
    func testOutlets() {
        XCTAssertNil(self.presenter.view, "Property not found")
        XCTAssertNil(self.presenter.viewScroll, "Property not found")
        XCTAssertNil(self.presenter.viewBoard, "Property not found")
        
    }
}
