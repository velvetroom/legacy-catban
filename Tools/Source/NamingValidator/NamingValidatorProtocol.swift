import Foundation

public protocol NamingValidatorProtocol {
    init()
    func validate(name:String) throws
}
