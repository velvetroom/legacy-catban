import Foundation
@testable import Tools

class MockNamerValidatorProtocol:NamerValidatorProtocol {
    static var validator:MockNamerValidatorProtocol?
    static var error:Error?
    var name:String!
    required init() { }
    
    func validate(name:String) throws {
        self.name = name
        MockNamerValidatorProtocol.validator = self
        if let error:Error = MockNamerValidatorProtocol.error {
            throw error
        }
    }
}
