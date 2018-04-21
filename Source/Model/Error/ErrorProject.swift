import Foundation

struct ErrorProject:LocalizedError {
    let errorDescription:String?
    
    static let oneColumnMinimum:ErrorProject = ErrorProject(errorDescription:String.localizedError(
        key:"ErrorProject_oneColumnMinimum"))
    static let oneProjectMinimum:ErrorProject = ErrorProject(errorDescription:String.localizedError(
        key:"ErrorProject_oneProjectMinimum"))
}
