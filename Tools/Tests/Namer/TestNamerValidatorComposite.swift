import XCTest
@testable import Tools

class TestNamerValidatorComposite:XCTestCase {
    private var model:NamerValidatorComposite!
    
    override func setUp() {
        super.setUp()
        self.model = NamerValidatorComposite()
    }
    
    override func tearDown() {
        super.tearDown()
        MockNamerValidatorProtocol.error = nil
    }
    
    func testCallValidators() {
        self.model.validators = [MockNamerValidatorProtocol.self]
        let string:String = "lorem ipsum"
        
        do { try self.model.validate(name:string) } catch { }
        XCTAssertNotNil(MockNamerValidatorProtocol.validator, "Failed to call validator")
        XCTAssertEqual(MockNamerValidatorProtocol.validator?.name, string, "Invalid name received")
    }
    
    func testHasValidators() {
        let expected:[NamerValidatorProtocol.Type] = self.expectedValidators()
        for expectedValidator:NamerValidatorProtocol.Type in expected {
            var found:Bool = false
            for validator:NamerValidatorProtocol.Type in self.model.validators {
                if validator == expectedValidator {
                    found = true
                    break
                }
            }
            XCTAssertTrue(found, "Validator not on composite list")
        }
    }
    
    func testSameAmountOfValidators() {
        let expected:[NamerValidatorProtocol.Type] = self.expectedValidators()
        XCTAssertEqual(expected.count, self.model.validators.count, "Not the same amount of validators")
    }
    
    func testErrorPassThrough() {
        MockNamerValidatorProtocol.error = NamerError.length
        self.model.validators = [MockNamerValidatorProtocol.self]
        XCTAssertThrowsError(try self.model.validate(name:String()), "Failed to propagate")
    }
    
    func testNotThrowingError() {
        self.model.validators = [MockNamerValidatorProtocol.self]
        XCTAssertNoThrow(try self.model.validate(name:String()), "Should no throw")
    }
    
    private func expectedValidators() -> [NamerValidatorProtocol.Type] {
        return [NamerValidatorLength.self,
                NamerValidatorVisible.self]
    }
}
