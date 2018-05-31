import Foundation
import Shared

class RepositoryFileFactory {
    class func makeDirectoryURL() -> URL {
        return userDirectory.appendingPathComponent(Configuration.directoryRoot)
    }
    
    private static var userDirectory:URL {
        get {
            return FileManager.default.urls(
                for:FileManager.SearchPathDirectory.documentDirectory,
                in:FileManager.SearchPathDomainMask.userDomainMask).last!
        }
    }
    
    private init() { }
}
