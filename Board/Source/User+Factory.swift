import Foundation

extension User {
    class func factoryNewUser() -> User {
        let user:User = User()
        user.identifier = UUID().uuidString
        return user
    }
}
