import XCTest
@testable import Shared
@testable import Column

class TestPresenter:XCTestCase {
    private var presenter:Presenter!
    private var delegate:MockPresenterDelegateProtocol!
    private var view:Column.View!
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.delegate = MockPresenterDelegateProtocol()
        self.presenter.delegate = self.delegate
        self.view = Column.View()
        XCTAssertNotNil(self.view.view)
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
    
    func testLoadsOutlets() {
        self.presenter.didLoad(view:self.view)
        XCTAssertNotNil(self.presenter.outlets.view, "Not loaded")
        XCTAssertNotNil(self.presenter.outlets.viewField, "Not loaded")
    }
    
    func testAssignsDelegateToField() {
        self.presenter.didLoad(view:self.view)
        XCTAssertNotNil(self.presenter.outlets.viewField?.delegate, "Not set")
    }
    
    func testCallDelegateOnLoad() {
        var called:Bool = false
        self.delegate.onDidLoadPresenter = {
            called = true
        }
        
        self.presenter.didLoad(view:self.view)
        XCTAssertTrue(called, "Not called")
    }
}
