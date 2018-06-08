import Foundation
import Shared

struct ErrorNaming:LocalizedError {
    let errorDescription:String?
    
    static let length:ErrorNaming = ErrorNaming(errorDescription:
        String.localized(key:"ErrorNaming_length", in:NamingValidatorComposite.self))
    
    static let visible:ErrorNaming = ErrorNaming(errorDescription:
        String.localized(key:"ErrorNaming_visible", in:NamingValidatorComposite.self))
}
