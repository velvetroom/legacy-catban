import XCTest
@testable import Tools

class TestNamerValidatorLength:XCTestCase {
    private var model:NamerValidatorLength!
    
    override func setUp() {
        super.setUp()
        self.model = NamerValidatorLength()
    }
    
    func testThrowsOnEmptyString() {
        XCTAssertThrowsError(try self.model.validate(name:String()), "Failed to validate")
    }
    
    func testNotThrowingOnNonEmpty() {
        XCTAssertNoThrow(try self.model.validate(name:" "), "Should not throw")
    }
}
