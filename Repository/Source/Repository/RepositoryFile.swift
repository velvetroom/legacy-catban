import Foundation

class RepositoryFile {
    let directoryUrl:URL
    let projectsUrl:URL
    
    init() {
        self.directoryUrl = RepositoryFileFactory.makeDirectoryUrl()
        self.projectsUrl = RepositoryFileFactory.makeProjectsWith(url:self.directoryUrl)
    }
    
    func buildStructure() throws {
        try self.makeDirectory(url:self.directoryUrl)
        try self.makeDirectory(url:self.projectsUrl)
    }
    
    private func makeDirectory(url:URL) throws {
        guard
            FileManager.default.fileExists(atPath:url.path) == false
        else { return }
        try FileManager.default.createDirectory(at:url, withIntermediateDirectories:true, attributes:nil)
        try self.excludeFromBackup(url:url)
    }
    
    private func excludeFromBackup(url:URL) throws {
        var url:URL = url
        var resourceValues:URLResourceValues = URLResourceValues()
        resourceValues.isExcludedFromBackup = true
        try url.setResourceValues(resourceValues)
    }
}
