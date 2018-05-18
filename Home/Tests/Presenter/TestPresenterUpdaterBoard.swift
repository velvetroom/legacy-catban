import XCTest
@testable import Home

class TestPresenterUpdaterBoard:XCTestCase {
    private var presenter:PresenterUpdaterBoard!
    private var view:ViewBoard!
    private var map:MockMapProtocol!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterUpdaterBoard()
        self.view = ViewBoard()
        self.map = MockMapProtocol()
        self.presenter.outlets = PresenterOutlets()
        self.presenter.outlets.viewBoard = self.view
        self.presenter.map = self.map
    }
    
    func testUpdate() {
        XCTAssertNil(self.view.drag.map, "Should be nil")
        self.presenter.update()
        XCTAssertNotNil(self.view.drag.map, "Failed to update")
    }
}
