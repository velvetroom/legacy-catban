import XCTest
import Board
@testable import Shared
@testable import Column

class TestPresenter:XCTestCase {
    private var presenter:Presenter!
    private var delegate:MockPresenterDelegateProtocol!
    private var view:Column.View!
    private var column:ColumnProtocol!
    private var controller:Controller!
    private struct Constants {
        static let name:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.delegate = MockPresenterDelegateProtocol()
        self.column = ColumnFactory.newColumn()
        self.controller = Controller()
        self.view = Column.View()
        self.controller.column = self.column
        self.presenter.delegate = self.delegate
        self.presenter.controller = self.controller
        XCTAssertNotNil(self.view.view)
        self.column.name = Constants.name
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
        XCTAssertNotNil(self.presenter.outlets.viewScroll, "Not loaded")
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
    
    func testUpdateFieldWithColumnName() {
        self.presenter.didLoad(view:self.view)
        self.presenter.shouldUpdate()
        XCTAssertEqual(self.presenter.outlets.viewField?.text, Constants.name, "Not updated")
    }
    
    func testLoadSetsSelfOnView() {
        self.presenter.didLoad(view:self.view)
        XCTAssertNotNil(view.presenter, "Not set")
    }
    
    func testPresenterCallsDelete() {
        self.presenter.outlets.view = self.view
        self.presenter.deleteType = MockPresenterDelete.self
        self.presenter.delete()
        XCTAssertNotNil(MockPresenterDelete.presenter, "Not called")
        XCTAssertNotNil(MockPresenterDelete.presenter?.controller, "Not injected")
        XCTAssertNotNil(MockPresenterDelete.presenter?.view, "Not injected")
    }
}
