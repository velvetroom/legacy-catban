import XCTest
import Shared
@testable import Projects

class TestPresenter:XCTestCase {
    private var presenter:Presenter!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
    }
    
    func testNotRetainingController() {
        self.presenter.controller = Controller()
        XCTAssertNil(self.presenter.controller, "Retains")
    }
    
    func testNotRetainingDelegate() {
        self.presenter.delegate = Controller()
        XCTAssertNil(self.presenter.delegate, "Retains")
    }
    
    func testViewType() {
        let viewType:Projects.View.Type? = self.presenter.viewType as? Projects.View.Type
        XCTAssertNotNil(viewType, "Invalid view type")
    }
}
