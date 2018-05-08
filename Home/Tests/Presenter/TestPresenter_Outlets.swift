import XCTest
@testable import Home
@testable import Shared

class TestPresenter_Outlets:XCTestCase {
    private var presenter:Presenter!
    private var view:Shared.View!
    private var outlets:PresenterOutlets!
    
    override func setUp() {
        super.setUp()
        self.view = Shared.View()
        self.presenter = Presenter()
        self.presenter.didLoad(view:self.view)
        self.outlets = self.presenter.outlets
    }
    
    func testLoad() {
        XCTAssertNotNil(self.outlets, "Failed to load outlets")
    }
    
    func testOutlets() {
        XCTAssertNotNil(self.outlets.view, "Failed to assign view")
    }
}
