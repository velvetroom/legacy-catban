import Foundation

class File:FileProtocol {
    var directory:URL
    
    var projects:URL {
        get {
            return self.directory.appendingPathComponent(Constants.projectsFolder)
        }
    }
    
    var user:URL {
        get {
            let file:URL = self.projects.appendingPathComponent(Constants.userFile)
            return file.appendingPathExtension(Constants.fileExtension)
        }
    }
    
    init() {
        self.directory = File.factoryDirectory()
        self.createDirectories()
    }
    
    private func createDirectories() {
        self.createDirectory(url:self.directory)
        self.createDirectory(url:self.projects)
    }
    
    private func createDirectory(url:URL) {
        guard
            FileManager.default.fileExists(atPath:url.path) == false
            else {
                return
        }
        self.excludeFromBackup(url:url)
        do {
            try FileManager.default.createDirectory(at:url, withIntermediateDirectories:true, attributes:nil)
        } catch { }
    }
    
    private func excludeFromBackup(url:URL) {
        var url:URL = url
        var resourceValues:URLResourceValues = URLResourceValues()
        resourceValues.isExcludedFromBackup = true
        do {
            try url.setResourceValues(resourceValues)
        }
        catch { }
    }
}
