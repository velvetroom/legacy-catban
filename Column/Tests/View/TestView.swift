import XCTest
@testable import Column

class TestView:XCTestCase {
    private var view:View!
    private var presenter:MockPresenter!
    
    override func setUp() {
        super.setUp()
        self.view = View()
        self.presenter = MockPresenter()
        self.view.presenter = self.presenter
    }
    
    func testNotRetainingPresenter() {
        self.view.presenter = Presenter()
        XCTAssertNil(self.view.presenter, "Retains")
    }
    
    func testLoadBase() {
        XCTAssertNotNil(self.view.view, "Loading view failed")
        XCTAssertNotNil(self.view.viewBase, "Not loaded")
    }
    
    func testCallsPresenterOnDone() {
        var called:Bool = false
        self.presenter.onDone = {
            called = true
        }
        
        self.view.selectorDone(button:UIButton())
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsPresenterOnDelete() {
        var called:Bool = false
        self.presenter.onDelete = {
            called = true
        }
        
        self.view.selectorDelete(button:UIButton())
        XCTAssertTrue(called, "Not called")
    }
}
