import Foundation

struct ErrorRepository:LocalizedError {
    let errorDescription:String?
    
    static let boardNotFoundLocally:ErrorRepository = ErrorRepository(errorDescription:String.localizedError(
        key:"ErrorRepository_boardNotFoundLocally"))
}
