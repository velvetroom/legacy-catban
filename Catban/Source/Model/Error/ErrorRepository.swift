import Foundation

struct ErrorRepository:LocalizedError {
    let errorDescription:String?
    
    static let boardNotFoundLocally:ErrorRepository = ErrorRepository(errorDescription:String.localizedError(
        key:"ErrorRepository_boardNotFoundLocally"))
    static let unableToFindCurrentProject:ErrorRepository = ErrorRepository(errorDescription:String.localizedError(
        key:"ErrorRepository_unableToFindCurrentProject"))
    static let noProjectsFound:ErrorRepository = ErrorRepository(errorDescription:String.localizedError(
        key:"ErrorRepository_noProjectsFound"))
    static let corruptedData:ErrorRepository = ErrorRepository(errorDescription:String.localizedError(
        key:"ErrorRepository_corruptedData"))
    static let malformedData:ErrorRepository = ErrorRepository(errorDescription:String.localizedError(
        key:"ErrorRepository_malformedData"))
    static let fileNotFound:ErrorRepository = ErrorRepository(errorDescription:String.localizedError(
        key:"ErrorRepository_fileNotFound"))
}