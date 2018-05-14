import XCTest
import Board
@testable import Home

class TestController_CreateCard:XCTestCase {
    private var controller:Controller!
    private var project:MockProjectManagedProtocol!
    private var transition:MockTransitionProtocol!
    
    override func setUp() {
        super.setUp()
        self.controller = Controller()
        self.project = MockProjectManagedProtocol()
        self.transition = MockTransitionProtocol()
        self.controller.project = self.project
        self.controller.transiton = self.transition
    }
    
    func testCreateCardCallsProject() {
        var called:Bool = false
        self.project.onAddCard = { (card:CardProtocol) in
            called = true
        }
        
        self.controller.createNewCard()
        XCTAssertTrue(called, "Not called")
    }
    
    func testCreatedCardHasIdentifier() {
        self.project.onAddCard = { (card:CardProtocol) in
            XCTAssertFalse(card.identifier.isEmpty, "No identifier")
        }
        self.controller.createNewCard()
    }
}
