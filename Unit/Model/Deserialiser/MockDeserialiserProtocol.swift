import Foundation
@testable import catban

class MockDeserialiserProtocol:DeserialiserProtocol {
    var onDeserialiseUser:((Data) -> Void)?
    
    func deserialise(user:Data) throws -> UserProtocol {
        self.onDeserialiseUser?(user)
        return User()
    }
}
