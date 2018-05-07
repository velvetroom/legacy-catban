import XCTest
@testable import Board

class TestString_Bundle:XCTestCase {
    private struct Constants {
        static let stringKey:String = "ProjectFactory_newKanbanProject_name"
        static let stringValue:String = "catban project"
    }
    
    func testLoadString() {
        let string:String = String.localized(key:Constants.stringKey)
        XCTAssertEqual(string, Constants.stringValue, "Invalid string received")
    }
}
