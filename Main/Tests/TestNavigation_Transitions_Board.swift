import XCTest
@testable import Main
@testable import Shared
@testable import Board

class TestNavigation_Transitions_Board:XCTestCase {
    private var model:Navigation!
    private var view:MockNavigationController!
    
    override func setUp() {
        super.setUp()
        Injection().load()
        self.model = Navigation()
        self.view = MockNavigationController()
        self.model.view = self.view
    }
    
    func testTransitionToCard() {
        var transition:Bool = false
        self.view.onSetViewController = { (views:[UIViewController], animated:Bool) in
            let view:View = views.first as! View
            let presenter:PresenterProtocol = view.delegate as! PresenterProtocol
            let controller:ControllerCardProtocol = presenter.delegate as! ControllerCardProtocol
            XCTAssertNotNil(controller, "Invalid view received")
            XCTAssertNotNil(controller.transiton, "Failed to assign transition")
            XCTAssertNotNil(controller.project, "Failed to inject project")
            XCTAssertNotNil(controller.card, "Failed to inject")
            transition = true
        }
        
        let board:BoardProtocol = BoardFactory.newBoard()
        let project:ProjectProtocol = ProjectFactory.newProject()
        let managed:ProjectManagedProtocol = board.manage(project:project)
        let card:CardProtocol = CardFactory.newCard()
        
        self.model.transitionTo(card:card, in:managed)
        XCTAssertTrue(transition, "Transition never happened")
    }
    
    func testTransitionToColumn() {
        var transition:Bool = false
        self.view.onSetViewController = { (views:[UIViewController], animated:Bool) in
            let view:View = views.first as! View
            let presenter:PresenterProtocol = view.delegate as! PresenterProtocol
            let controller:ControllerColumnProtocol = presenter.delegate as! ControllerColumnProtocol
            XCTAssertNotNil(controller, "Invalid view received")
            XCTAssertNotNil(controller.transiton, "Failed to assign transition")
            XCTAssertNotNil(controller.project, "Failed to inject project")
            XCTAssertNotNil(controller.column, "Failed to inject")
            transition = true
        }
        
        let board:BoardProtocol = BoardFactory.newBoard()
        let project:ProjectProtocol = ProjectFactory.newProject()
        let managed:ProjectManagedProtocol = board.manage(project:project)
        let column:ColumnProtocol = ColumnFactory.newColumn()
        
        self.model.transitionTo(column:column, in:managed)
        XCTAssertTrue(transition, "Transition never happened")
    }
}
