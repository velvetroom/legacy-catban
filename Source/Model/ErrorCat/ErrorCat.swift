import Foundation

struct ErrorCat:LocalizedError {
    let errorDescription:String?
    
    static let oneColumnMinimum:ErrorCat = ErrorCat(errorDescription:String.localizedError(
        key:"ErrorCat_oneColumnMinimum"))
}
