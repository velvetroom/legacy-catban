import XCTest
import Board
@testable import Projects

class TestController:XCTestCase {
    private var controller:Controller!
    private var transition:MockTransitionProtocol!
    private var board:MockBoardProjectsProtocol!
    
    override func setUp() {
        super.setUp()
        self.controller = Controller()
        self.transition = MockTransitionProtocol()
        self.board = MockBoardProjectsProtocol()
        self.controller.transiton = self.transition
        self.controller.board = self.board
        self.board.project = ProjectFactory.newProject()
    }
    
    func testNotRetainingTransition() {
        self.controller.transiton = MockTransitionProtocol()
        XCTAssertNil(self.controller.transiton, "Retains")
    }
    
    func testRetainsBoard() {
        self.controller.board = MockBoardProjectsProtocol()
        XCTAssertNotNil(self.controller.board, "Not retaining")
    }
    
    func testOpenProject() {
        var transitioned:Bool = false
        self.transition.onTransitionToHome = {
            transitioned = true
        }
        
        self.controller.openProjectWith(identifier:String())
        XCTAssertTrue(transitioned, "Failed")
    }
}
