import Foundation
import Shared

class RepositoryFileFactory {
    class func makeUrl() -> RepositoryFileUrl {
        var url:RepositoryFileUrl = RepositoryFileUrl()
        let user:URL = makeUser()
        url.directoryUrl = makeDirectoryWith(user:user)
        url.projectsUrl = makeProjectsWith(directoryUrl:url.directoryUrl)
        url.boardUrl = makeBoardWith(directoryUrl:url.directoryUrl)
        return url
    }
    
    private class func makeUser() -> URL {
        return FileManager.default.urls(
            for:FileManager.SearchPathDirectory.documentDirectory,
            in:FileManager.SearchPathDomainMask.userDomainMask).last!
    }
    
    private class func makeDirectoryWith(user:URL) -> URL {
        return user.appendingPathComponent(Configuration.directoryRoot)
    }
    
    private class func makeProjectsWith(directoryUrl:URL) -> URL {
        return directoryUrl.appendingPathComponent(RepositoryConstants.Url.directoryProjects)
    }
    
    private class func makeBoardWith(directoryUrl:URL) -> URL {
        let file:URL = directoryUrl.appendingPathComponent(RepositoryConstants.Url.boardName)
        return file.appendingPathExtension(RepositoryConstants.Url.fileExtension)
    }
    
    private init() { }
}
