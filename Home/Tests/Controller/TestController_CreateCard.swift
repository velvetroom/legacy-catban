import XCTest
import Shared
import Canvas
@testable import Board
@testable import Home

class TestController_CreateCard:XCTestCase {
    private var controller:Controller!
    private var project:MockProjectManagedProtocol!
    private var transition:MockTransitionProtocol!
    private var column:ColumnProtocol!
    
    override func setUp() {
        super.setUp()
        Configuration.canvasType = Canvas.self
        self.controller = Controller()
        self.project = MockProjectManagedProtocol()
        self.column = ColumnFactory.newColumn()
        self.transition = MockTransitionProtocol()
        self.controller.project = self.project
        self.controller.transiton = self.transition
        self.project.add(column:self.column)
    }
    
    func testCreateCardCallsProject() {
        self.controller.createNewCard()
        XCTAssertEqual(self.column.countCards, 1, "Not called")
    }
    
    func testCreatedCardHasIdentifier() {
        self.controller.createNewCard()
        self.column.iterate { (card:CardProtocol) in
            XCTAssertFalse(card.identifier.isEmpty, "No identifier")
        }
    }
}
