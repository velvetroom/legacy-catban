import XCTest
@testable import Domain

class TestSession:XCTestCase {
    private var session:Configuration.SessionType!
    private var library:Library!

    override func setUp() {
        super.setUp()
        Configuration.repositoryType = MockRepositoryProtocol.self
        self.session = Configuration.SessionType()
        self.library = Library()
    }

    func testSelectingBoard() {
        let boardA:Configuration.BoardType = Configuration.BoardType()
        let boardB:Configuration.BoardType = Configuration.BoardType()
        let boardC:Configuration.BoardType = Configuration.BoardType()
        self.library.boards = [boardA, boardB, boardC]
        XCTAssertThrowsError(try self.session.current(library:self.library), "Should be no selection")
        
        self.session.select(index:1)
        var board:BoardProtocol!
        XCTAssertNoThrow(try board = self.session.current(library:self.library), "Failed to select")
        XCTAssertTrue(board === boardB, "Invalid board returned")
        
        self.session.clearSelection()
        XCTAssertThrowsError(try self.session.current(library:self.library), "Selection not cleared")
    }
}
