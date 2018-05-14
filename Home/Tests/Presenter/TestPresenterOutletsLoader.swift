import XCTest
@testable import Home

class TestPresenterOutletsLoader:XCTestCase {
    private var presenter:PresenterOutletsLoader!
    private var parentPresenter:Presenter!
    private var outlets:PresenterOutlets!
    private var view:View!
    
    override func setUp() {
        super.setUp()
        self.presenter = PresenterOutletsLoader()
        self.view = View()
        self.parentPresenter = Presenter()
        self.presenter.presenter = self.parentPresenter
        self.presenter.view = self.view
        self.presenter.loadOutlets()
        self.outlets = self.parentPresenter.outlets
    }
    
    func testLoadOutlets() {
        XCTAssertNotNil(self.outlets.view, "Failed to load")
        XCTAssertNotNil(self.outlets.viewScroll, "Failed to load")
        XCTAssertNotNil(self.outlets.viewBoard, "Failed to load")
        XCTAssertNotNil(self.outlets.viewBoard?.dragDelegate, "Delegate not assigned")
    }
    
    func testNotRetainingView() {
        self.parentPresenter = nil
        self.presenter.view = View()
        XCTAssertNil(self.presenter.view, "Retaining view")
    }
}
