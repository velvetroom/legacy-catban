import Foundation

class DeserialiserHistory {
    class func deserialise(user:Data) throws -> UserProtocol {
        self.onDeserialiseUser?(user)
        if let throwError:Error = self.throwError {
            throw throwError
        }
        return self.user
    }
}
