import XCTest
@testable import Cloud

class TestView_Actions:XCTestCase {
    private var view:Cloud.View!
    private var presenter:MockPresenter!
    
    override func setUp() {
        super.setUp()
        self.view = Cloud.View()
        self.presenter = MockPresenter()
        self.view.presenter = self.presenter
    }
    
    func testSaveCallsPresenter() {
        var called:Bool = false
        self.presenter.onSave = { called = true }
        self.view.selectorSave()
        XCTAssertTrue(called, "Not called")
    }
    
    func testShareCallsPresenter() {
        var called:Bool = false
        self.presenter.onShare = { called = true }
        self.view.selectorShare()
        XCTAssertTrue(called, "Not called")
    }
}
