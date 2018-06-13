import XCTest
@testable import Tools

class TestNamerValidatorVisible:XCTestCase {
    private var model:NamerValidatorVisible!
    
    override func setUp() {
        super.setUp()
        self.model = NamerValidatorVisible()
    }
    
    func testNoThrowsOnRegularName() {
        XCTAssertNoThrow(try self.model.validate(name:"Lorem ipsum"), "Should not throw")
    }
    
    func testNoThrowOnEmpty() {
        XCTAssertNoThrow(try self.model.validate(name:String()), "Should not throw")
    }
    
    func testNoThrowsOnHiddenCharacter() {
        XCTAssertNoThrow(try self.model.validate(name:"          .          "), "Should not throw")
    }
    
    func testThrowsOnSpace() {
        XCTAssertThrowsError(try self.model.validate(name:" "), "Failed to validate")
    }
    
    func testThrowsOnMultipleSpace() {
        XCTAssertThrowsError(try self.model.validate(name:"               "), "Failed to validate")
    }
    
    func testThrowsOnNewLine() {
        XCTAssertThrowsError(try self.model.validate(name:"\n"), "Failed to validate")
    }
    
    func testThrowsOnCarriageReturn() {
        XCTAssertThrowsError(try self.model.validate(name:"\r"), "Failed to validate")
    }
    
    func testThrowsOnTab() {
        XCTAssertThrowsError(try self.model.validate(name:"\t"), "Failed to validate")
    }
    
    func testThrowsOnMultipleTabs() {
        XCTAssertThrowsError(try self.model.validate(name:"\t\t\t\t\t"), "Failed to validate")
    }
}
