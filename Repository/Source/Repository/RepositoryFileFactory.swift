import Foundation
import Shared

class RepositoryFileFactory {
    class func makeDirectoryUrl() -> URL {
        return userDirectory.appendingPathComponent(Configuration.directoryRoot)
    }
    
    class func makeProjectsWith(url:URL) -> URL {
        return url.appendingPathComponent(RepositoryConstants.directoryProjects)
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
