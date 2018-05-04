import XCTest
@testable import Repository

class TestErrorRepository:XCTestCase {
    func testBoardNotFound() {
        let string:String = ErrorRepository.boardNotFound.localizedDescription
        XCTAssertFalse(string.isEmpty, "Failed to load error message")
    }
}
