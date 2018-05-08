import XCTest
@testable import Home

class TestPresenterOutletsLoader:XCTestCase {
    private var presenter:PresenterOutletsLoader!
    private var outlets:PresenterOutlets!
    private var view:View!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterOutletsLoader()
        self.view = View()
        self.presenter.loadFor(view:self.view)
        self.outlets = self.presenter.outlets
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.outlets, "Failed to load outlets")
    }
    
    func testLoadOutlets() {
        XCTAssertNotNil(self.outlets.viewScroll, "Failed to load")
        XCTAssertNotNil(self.outlets.viewBoard, "Failed to load")
    }
}
