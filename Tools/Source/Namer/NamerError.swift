import Foundation
import Shared

struct NamerError:LocalizedError {
    let errorDescription:String?
    
    static let length:NamerError = NamerError(errorDescription:
        String.localized(key:"NamerError_length", in:NamerValidatorComposite.self))
    
    static let visible:NamerError = NamerError(errorDescription:
        String.localized(key:"NamerError_visible", in:NamerValidatorComposite.self))
}
