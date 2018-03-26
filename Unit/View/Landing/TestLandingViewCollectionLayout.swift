import XCTest
@testable import catban

class TestLandingViewCollectionLayout:XCTestCase {
    private var layout:LandingViewCollectionLayout!
    
    override func setUp() {
        super.setUp()
        self.layout = LandingViewCollectionLayout()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.layout, "Failed to load layout")
        XCTAssertNotNil(self.layout.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.layout.attributesList, "Failed to load attributes")
    }
}
