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
}
