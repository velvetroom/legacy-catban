import Foundation

struct ErrorUpdater:LocalizedError {
    let errorDescription:String?
    
    static let commitsNotFound:ErrorUpdater = ErrorUpdater(errorDescription:
        "Error Updater: Commits not found")
    static let plistNotFound:ErrorUpdater = ErrorUpdater(errorDescription:
        "Error Updater: Plist not found")
}
