import XCTest
@testable import Home

class TestPresenter_Outlets:XCTestCase {
    private var presenter:Presenter!
    private var view:ViewScroll!
    private var outlets:PresenterOutlets!
    
    override func setUp() {
        super.setUp()
        self.view = ViewScroll()
        self.presenter = Presenter()
        self.presenter.didLoad(view:self.view)
        self.outlets = self.presenter.outlets
    }
    
    func testLoad() {
        XCTAssertNotNil(self.outlets, "Failed to load outlets")
    }
    
    func testOutlets() {
        XCTAssertNotNil(self.outlets.viewScroll, "Failed to assign view scroll")
    }
}
