import Foundation
import Shared

class MockNamingValidatorProtocol:NamingValidatorProtocol {
    static var validator:MockNamingValidatorProtocol?
    var name:String!
    required init() { }
    
    func validate(name:String) throws {
        self.name = name
        MockNamingValidatorProtocol.validator = self
    }
}
