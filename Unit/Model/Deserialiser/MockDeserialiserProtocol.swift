import Foundation
@testable import catban

class MockDeserialiserProtocol:DeserialiserProtocol {
    var onDeserialiseUser:((Data) -> Void)?
    var throwError:Error?
    var user:UserProtocol
    
    init() {
        self.user = User()
    }
    
    func deserialise(user:Data) throws -> UserProtocol {
        self.onDeserialiseUser?(user)
        if let throwError:Error = self.throwError {
            throw throwError
        }
        return self.user
    }
}
