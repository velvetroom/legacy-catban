import XCTest
@testable import Home
@testable import Board

class TestController_Transition:XCTestCase {
    private var controller:Controller!
    private var transition:MockTransitionProtocol!
    private var project:ProjectManagedProtocol!
    private var card:CardProtocol!
    
    override func setUp() {
        super.setUp()
        self.controller = Controller()
        self.transition = MockTransitionProtocol()
        self.card = CardFactory.newCard()
        let board:BoardProtocol = BoardFactory.newBoard()
        let project:ProjectProtocol = ProjectFactory.newProject()
        let managed:ProjectManagedProtocol = board.manage(project:project)
        self.project = managed
        self.controller.project = self.project
        self.controller.transiton = self.transition
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Not loading")
        XCTAssertNotNil(self.transition, "Not loading")
        XCTAssertNotNil(self.project, "Not loading")
        XCTAssertNotNil(self.card, "Not loading")
    }
    
    func testEditCardTransitionsToCard() {
        var transitioned:Bool = false
        self.transition.onTransitionToCard = { (card:CardProtocol, project:ProjectManagedProtocol) in
            transitioned = true
        }
        
        self.controller.editCard(card:self.card)
        XCTAssertTrue(transitioned, "Failed to transition")
    }
}
