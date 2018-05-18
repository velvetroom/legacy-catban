import XCTest
@testable import Home

class TestPresenterUpdaterScroll:XCTestCase {
    private var presenter:PresenterUpdaterScroll!
    private var view:ViewScroll!
    private var map:MockMapProtocol!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterUpdaterScroll()
        self.view = ViewScroll()
        self.map = MockMapProtocol()
        self.presenter.outlets = PresenterOutlets()
        self.presenter.outlets.viewScroll = self.view
        self.presenter.map = self.map
    }
    
    func testUpdate() {
        XCTAssertNil(self.map.viewScroll, "Should be nil")
        self.presenter.update()
        XCTAssertNotNil(self.map.viewScroll, "Failed to update")
    }
    
    func testNotRetainingMap() {
        self.presenter.map = MockMapProtocol()
        XCTAssertNil(self.presenter.map, "Retains")
    }
}
