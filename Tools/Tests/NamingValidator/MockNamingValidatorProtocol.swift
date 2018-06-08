import Foundation
import Tools

class MockNamingValidatorProtocol:NamingValidatorProtocol {
    static var validator:MockNamingValidatorProtocol?
    static var error:Error?
    var name:String!
    required init() { }
    
    func validate(name:String) throws {
        self.name = name
        MockNamingValidatorProtocol.validator = self
        if let error:Error = MockNamingValidatorProtocol.error {
            throw error
        }
    }
}
