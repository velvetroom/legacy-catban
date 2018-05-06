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
        let viewType:Load.View.Type? = self.presenter.viewType as? Load.View.Type
        XCTAssertNotNil(viewType, "View type is not Load.ViewType")
    }
}
