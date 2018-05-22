import XCTest
@testable import Column

class TestPresenter:XCTestCase {
    private var presenter:Presenter!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
    }
    
    func testViewType() {
        let view:Column.View? = self.presenter.view as? Column.View
        XCTAssertNotNil(view, "Invalid view received")
    }
    
    func testNotRetainingController() {
        self.presenter.controller = Controller()
        XCTAssertNil(self.presenter.controller, "Retains controller")
    }
    
    func testNotRetainingDelegate() {
        self.presenter.delegate = Controller()
        XCTAssertNil(self.presenter.delegate, "Retains delegate")
    }
}
