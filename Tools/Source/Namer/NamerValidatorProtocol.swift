import Foundation

protocol NamerValidatorProtocol {
    init()
    func validate(name:String) throws
}
