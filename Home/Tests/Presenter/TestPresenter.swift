import XCTest
@testable import Shared
@testable import Home

class TestPresenter:XCTestCase {
    private var presenter:Presenter!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.view.delegate, "Failed to assign delegate")
    }
    
    func testLoadView() {
        let view:Home.View? = self.presenter.view as? Home.View
        XCTAssertNotNil(view, "Invalid view received")
    }
}
