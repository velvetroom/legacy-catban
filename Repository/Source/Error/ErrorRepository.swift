import Foundation
import Shared

struct ErrorRepository:LocalizedError {
    let errorDescription:String?
    
    static let fileNotFound:ErrorRepository = ErrorRepository(errorDescription:
        String.localized(key:"ErrorRepository_FileNotFound", in:Repository.self))
    static let boardNotFound:ErrorRepository = ErrorRepository(errorDescription:
        String.localized(key:"ErrorRepository_boardNotFound", in:Repository.self))
}
