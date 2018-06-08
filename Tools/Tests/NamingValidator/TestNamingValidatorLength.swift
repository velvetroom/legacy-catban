import XCTest
@testable import Tools

class TestNamingValidatorLength:XCTestCase {
    private var model:NamingValidatorLength!
    
    override func setUp() {
        super.setUp()
        self.model = NamingValidatorLength()
    }
    
    func testThrowsOnEmptyString() {
        XCTAssertThrowsError(try self.model.validate(name:String()), "Failed to validate")
    }
    
    func testNotThrowingOnNonEmpty() {
        XCTAssertNoThrow(try self.model.validate(name:" "), "Should not throw")
    }
}
