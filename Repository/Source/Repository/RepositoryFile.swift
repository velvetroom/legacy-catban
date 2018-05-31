import Foundation

class RepositoryFile {
    
    /*
    
    var directory:URL
    
    var projects:URL {
        get {
            return self.directory.appendingPathComponent(Constants.projectsFolder)
        }
    }
    
    var user:URL {
        get {
            let file:URL = self.directory.appendingPathComponent(Constants.userFile)
            return file.appendingPathExtension(Constants.fileExtension)
        }
    }
    
    init() {
        self.directory = File.factoryDirectory()
        do { try self.createDirectories() } catch { }
    }
    
    func createDirectories() throws {
        try self.createDirectory(url:self.directory)
        try self.createDirectory(url:self.projects)
    }
    
    func urlForProject(identifier:String) -> URL {
        return self.projects.appendingPathComponent(identifier).appendingPathExtension(Constants.fileExtension)
    }
    
    private func createDirectory(url:URL) throws {
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
    }*/
}
