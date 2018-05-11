import XCTest
import Board
@testable import Card
@testable import Shared

class TestPresenter:XCTestCase {
    private var presenter:Presenter!
    private var delegate:MockControllerProtocol!
    private var view:Shared.View!
    private var controller:Controller!
    private var card:CardProtocol!
    private var column:ColumnProtocol!
    private var text:MockViewText!
    private struct Constants {
        static let columnName:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = Presenter()
        self.delegate = MockControllerProtocol()
        self.view = Shared.View()
        self.controller = Controller()
        self.column = ColumnFactory.newColumn()
        self.card = CardFactory.newCard()
        self.text = MockViewText()
        self.card.container = self.column
        self.presenter.controller = self.controller
        self.presenter.delegate = self.delegate
        self.controller.card = self.card
        self.column.name = Constants.columnName
        self.controller.card.content = Constants.columnName
        self.presenter.outlets.view = self.view
        self.presenter.outlets.viewText = self.text
        XCTAssertNotNil(self.view.view, "Loading view")
    }
    
    func testDelegateIsNotRetained() {
        self.presenter.delegate = Controller()
        XCTAssertNil(self.presenter.delegate, "Strong retained delegate")
    }
    
    func testControllerIsNotRetained() {
        self.presenter.controller = Controller()
        XCTAssertNil(self.presenter.controller, "Strong retained controller")
    }
    
    func testViewType() {
        let view:Card.View? = self.presenter.view as? Card.View
        XCTAssertNotNil(view, "Invalid view received")
    }
    
    func testLoadViewCallsDelegate() {
        var delegateCalled:Bool = false
        self.delegate.onDidLoadPresenter = {
            delegateCalled = true
        }
        
        self.presenter.didLoad(view:self.view)
        XCTAssertTrue(delegateCalled, "Failed to call delegate")
    }
    
    func testLoadOutlets() {
        self.presenter.didLoad(view:self.view)
        XCTAssertNotNil(self.presenter.outlets.viewText, "Not loaded")
    }
    
    func testShouldUpdate() {
        self.presenter.shouldUpdate()
        XCTAssertEqual(self.view.title, Constants.columnName, "Failed to update")
    }
    
    func testTextBecomesFirstResponder() {
        var firstResponder:Bool = false
        self.text.onBecomeFirstResponder = {
            firstResponder = true
        }
        
        self.presenter.didAppear(view:self.view)
        XCTAssertTrue(firstResponder, "Not first responder")
    }
}
