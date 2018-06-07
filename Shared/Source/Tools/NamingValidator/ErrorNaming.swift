import Foundation

struct ErrorNaming:LocalizedError {
    let errorDescription:String?
    
    static let length:ErrorNaming = ErrorNaming(errorDescription:
        String.localized(key:"ErrorNaming_length", in:NamingValidatorComposite.self))
}
