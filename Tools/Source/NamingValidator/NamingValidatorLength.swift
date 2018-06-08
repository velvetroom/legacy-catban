import Foundation

class NamingValidatorLength:NamingValidatorProtocol {
    required init() { }
    
    func validate(name:String) throws {
        if name.isEmpty {
            throw ErrorNaming.length
        }
    }
}
