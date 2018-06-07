import XCTest
@testable import Shared

class TestNamingValidatorComposite:XCTestCase {
    private var model:NamingValidatorComposite!
    
    override func setUp() {
        super.setUp()
        self.model = NamingValidatorComposite()
    }
    
    func testCallValidators() {
        self.model.validators = [MockNamingValidatorProtocol.self]
        let string:String = "lorem ipsum"
        
        do { try self.model.validate(name:string) } catch { }
        XCTAssertNotNil(MockNamingValidatorProtocol.validator, "Failed to call validator")
        XCTAssertEqual(MockNamingValidatorProtocol.validator?.name, string, "Invalid name received")
    }
    
    func testHasValidators() {
        let expected:[NamingValidatorProtocol.Type] = self.expectedValidators()
        for expectedValidator:NamingValidatorProtocol.Type in expected {
            var found:Bool = false
            for validator:NamingValidatorProtocol.Type in self.model.validators {
                if validator == expectedValidator {
                    found = true
                    break
                }
            }
            XCTAssertTrue(found, "Validator not on composite list")
        }
    }
    
    func testSameAmountOfValidators() {
        let expected:[NamingValidatorProtocol.Type] = self.expectedValidators()
        XCTAssertEqual(expected.count, self.model.validators.count, "Not the same amount of validators")
    }
    
    private func expectedValidators() -> [NamingValidatorProtocol.Type] {
        return [NamingValidatorLength.self]
    }
}
