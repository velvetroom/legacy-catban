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
        self.card.container = self.column
        self.presenter.outlets.view = self.view
        self.presenter.controller = self.controller
        self.presenter.delegate = self.delegate
        self.controller.card = self.card
        self.column.name = Constants.columnName
        self.controller.card.content = Constants.columnName
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
    
    func testSetsTextDelegate() {
        let view:Card.View = Card.View()
        self.presenter.didLoad(view:view)
        XCTAssertNotNil(self.presenter.outlets.viewText?.delegate, "Not set")
    }
    
    func testShouldUpdate() {
        self.presenter.shouldUpdate()
        XCTAssertEqual(self.view.title, Constants.columnName, "Failed to update")
    }
    
    func testLoadSetsSelfOnView() {
        let view:Card.View = Card.View()
        self.presenter.didLoad(view:view)
        XCTAssertNotNil(view.presenter, "Not set")
    }
}
