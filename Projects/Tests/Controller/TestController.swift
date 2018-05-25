import XCTest
@testable import Projects

class TestController:XCTestCase {
    private var controller:Controller!
    
    override func setUp() {
        super.setUp()
        self.controller = Controller()
    }
    
    func testNotRetainingTransition() {
        self.controller.transiton = MockTransitionProtocol()
        XCTAssertNil(self.controller.transiton, "Retains")
    }
    
    func testRetainsBoard() {
        self.controller.board = MockBoardProjectsProtocol()
        XCTAssertNotNil(self.controller.board, "Not retaining")
    }
}
