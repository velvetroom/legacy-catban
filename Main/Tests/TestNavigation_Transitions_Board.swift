import XCTest
import Board
@testable import Main
@testable import Shared
@testable import Card
@testable import Column

class TestNavigation_Transitions_Board:XCTestCase {
    private var model:Navigation!
    private var view:MockNavigationView!
    
    override func setUp() {
        super.setUp()
        Injection().load()
        self.model = Navigation()
        self.view = MockNavigationView()
        self.model.view = self.view
    }
    
    func testTransitionToCard() {
        var transition:Bool = false
        self.view.onSetViewController = { (views:[UIViewController], animated:Bool) in
            let view:Card.View? = views.first as? Card.View
            XCTAssertNotNil(view, "Invalid view received")
            XCTAssertNotNil(view?.transition, "Failed to assign transition")
            XCTAssertNotNil(view?.presenter.interactor.project, "Failed to inject project")
            XCTAssertNotNil(view?.presenter.interactor.card, "Failed to inject")
            XCTAssertNotNil(view?.presenter.interactor.board, "Failed to inject")
            transition = true
        }
        
        let board:BoardProtocol = BoardFactory.newBoard()
        let project:ProjectProtocol = ProjectFactory.newProject()
        let card:CardProtocol = CardFactory.newCard()
        self.model.transitionTo(card:card, board:board, project:project)
        XCTAssertTrue(transition, "Transition never happened")
    }
    
    func testTransitionToColumn() {
        var transition:Bool = false
        self.view.onSetViewController = { (views:[UIViewController], animated:Bool) in
            let view:Column.View? = views.first as? Column.View
            XCTAssertNotNil(view, "Invalid view received")
            XCTAssertNotNil(view?.transition, "Failed to assign transition")
            XCTAssertNotNil(view?.presenter.interactor.project, "Failed to inject project")
            XCTAssertNotNil(view?.presenter.interactor.column, "Failed to inject")
            XCTAssertNotNil(view?.presenter.interactor.board, "Failed to inject")
            transition = true
        }
        
        let board:BoardProtocol = BoardFactory.newBoard()
        let project:ProjectProtocol = ProjectFactory.newProject()
        let column:ColumnProtocol = ColumnFactory.newColumn()
        self.model.transitionTo(column:column, board:board, project:project)
        XCTAssertTrue(transition, "Transition never happened")
    }
}
