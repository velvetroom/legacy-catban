import Foundation

extension User {
    class func factoryNewUser() -> UserProtocol {
        let user:User = User()
        user.identifier = UUID().uuidString
        return user
    }
}
