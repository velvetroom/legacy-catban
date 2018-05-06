import XCTest
@testable import Load

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
    
    func testViewType() {
        let view:Load.View? = self.presenter.view as? Load.View
        XCTAssertNotNil(view, "Invalid view received")
    }
}
