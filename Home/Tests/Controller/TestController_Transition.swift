import XCTest
import Shared
import Canvas
@testable import Home
@testable import Board

class TestController_Transition:XCTestCase {
    private var controller:Controller!
    private var transition:MockTransitionProtocol!
    private var project:ProjectManagedProtocol!
    private struct Constants {
        static let identifier:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        Configuration.canvasType = Canvas.self
        self.controller = Controller()
        self.transition = MockTransitionProtocol()
        var card:CardProtocol = CardFactory.newCard()
        card.identifier = Constants.identifier
        let column:ColumnProtocol = ColumnFactory.newColumn()
        column.add(card:card)
        let board:BoardProtocol = BoardFactory.newBoard()
        let project:ProjectProtocol = ProjectFactory.newProject()
        let managed:ProjectManagedProtocol = board.manage(project:project)
        managed.add(column:column)
        self.project = managed
        self.controller.project = self.project
        self.controller.transiton = self.transition
    }
    
    func testCreateCardTransitionsToCard() {
        var transitioned:Bool = false
        self.transition.onTransitionToCard = { (card:CardProtocol, project:ProjectManagedProtocol) in
            transitioned = true
        }
        
        self.controller.createNewCard()
        XCTAssertTrue(transitioned, "Failed to transition")
    }
    
    func testEditCardTransitionsToCard() {
        var transitioned:Bool = false
        self.transition.onTransitionToCard = { (card:CardProtocol, project:ProjectManagedProtocol) in
            transitioned = true
        }
        
        self.controller.editCardWith(identifier:Constants.identifier)
        XCTAssertTrue(transitioned, "Failed to transition")
    }
    
    func testCreateColumnTransitionsToColumn() {
        var transitioned:Bool = false
        self.transition.onTransitionToColumn = {
            transitioned = true
        }
        
        self.controller.createNewColumn()
        XCTAssertTrue(transitioned, "Failed to transition")
    }
    
    func testEditColumnTransitionsToColumn() {
        var transitioned:Bool = false
        var column:ColumnProtocol = ColumnFactory.newColumn()
        column.identifier = Constants.identifier
        self.project.add(column:column)
        self.transition.onTransitionToColumn = {
            transitioned = true
        }

        self.controller.editColumnWith(identifier:Constants.identifier)
        XCTAssertTrue(transitioned, "Failed to transition")
    }
}
