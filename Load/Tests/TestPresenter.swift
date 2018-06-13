import XCTest
@testable import Load

class TestPresenter:XCTestCase {
    private var presenter:Presenter!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
    }
    
    func testNotRetainingView() {
        self.presenter.presenting = View()
        XCTAssertNil(self.presenter.presenting, "Retains")
    }
}
