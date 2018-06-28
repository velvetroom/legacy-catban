import XCTest
@testable import Board

class TestBoard_Equatable:XCTestCase {
    private var model:Board!
    private struct Constants {
        static let identifier:String = "lorem ipsum"
    }
    
    override func setUp() {
        super.setUp()
        self.model = Board()
        self.model.identifier = Constants.identifier
    }
    
    func testNonEmptyIdentifier() {
        XCTAssertFalse(self.model.identifier.isEmpty, "Identifier should not be empty")
    }
    
    func testCompareWithEmptyIdentifier() {
        XCTAssertNotEqual(self.model, Board(), "Comparison should fail")
    }
    
    func testCompareWithNewBoard() {
        let newBoard:Board = BoardFactory.newBoard() as! Board
        XCTAssertNotEqual(self.model, newBoard, "Comparison should fail")
    }
    
    func testCompareWithSelf() {
        let selfBoard:Board = self.model
        XCTAssertEqual(self.model, selfBoard, "Comparison should Succeed")
    }
    
    func testComparingTwoEmpties() {
        let newBoardA:Board = Board()
        let newBoardB:Board = Board()
        XCTAssertNotEqual(newBoardA, newBoardB, "Empty identifiers should always fail")
    }
}
