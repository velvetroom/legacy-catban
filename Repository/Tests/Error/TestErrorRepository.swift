import XCTest
@testable import Repository

class TestErrorRepository:XCTestCase {
    func testBoardNotFound() {
        let string:String = ErrorRepository.boardNotFound.localizedDescription
        XCTAssertFalse(string.isEmpty, "Failed to load error message")
    }
    
    func testFileNotFound() {
        let string:String = ErrorRepository.fileNotFound.localizedDescription
        XCTAssertFalse(string.isEmpty, "Failed to load error message")
    }
    
    func testCorruptedData() {
        let string:String = ErrorRepository.corruptedData.localizedDescription
        XCTAssertFalse(string.isEmpty, "Failed to load error message")
    }
    
    func testMalformedData() {
        let string:String = ErrorRepository.malformedData.localizedDescription
        XCTAssertFalse(string.isEmpty, "Failed to load error message")
    }
}
