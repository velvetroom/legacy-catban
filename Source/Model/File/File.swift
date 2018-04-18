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
    
    func loadUser() throws -> Data {
        return try self.loadFileAt(url:self.user)
    }
    
    func loadProjects() throws -> [Data] {
        let urls:[URL] = try self.projectUrls()
        if urls.isEmpty {
            throw ErrorRepository.noProjectsFound
        }
        return try self.projectsWith(urls:urls)
    }
    
    func createDirectories() {
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
    
    private func loadFileAt(url:URL) throws -> Data {
        if FileManager.default.fileExists(atPath:url.path) {
            return try Data(contentsOf:url)
        }
        throw ErrorRepository.fileNotFound
    }
    
    private func projectUrls() throws -> [URL] {
        var urls:[URL] = []
        let strings:[String] = try FileManager.default.contentsOfDirectory(atPath:self.projects.path)
        for string:String in strings {
            let url:URL = self.projects.appendingPathComponent(string)
            urls.append(url)
        }
        return urls
    }
    
    private func projectsWith(urls:[URL]) throws -> [Data] {
        var projects:[Data] = []
        for url:URL in urls {
            let project:Data = try self.loadFileAt(url:url)
            projects.append(project)
        }
        return projects
    }
}
