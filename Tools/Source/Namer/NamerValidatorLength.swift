import Foundation

class NamerValidatorLength:NamerValidatorProtocol {
    required init() { }
    
    func validate(name:String) throws {
        if name.isEmpty {
            throw NamerError.length
        }
    }
}
