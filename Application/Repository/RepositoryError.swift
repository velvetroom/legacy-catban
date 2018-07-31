import Foundation

struct RepositoryError:LocalizedError {
    let errorDescription:String?
    
    static let sessionNotFound:RepositoryError = RepositoryError(errorDescription:NSLocalizedString(
        "RepositoryError.sessionNotFound", comment:String()))
    static let boardNotFound:RepositoryError = RepositoryError(errorDescription:NSLocalizedString(
        "RepositoryError.boardNotFound", comment:String()))
}
