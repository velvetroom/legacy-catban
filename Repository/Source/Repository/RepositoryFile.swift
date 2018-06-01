import Foundation

class RepositoryFile {
    let url:RepositoryFileUrl
    
    init() {
        self.url = RepositoryFileFactory.makeUrl()
    }
    
    func buildStructure() throws {
        try self.makeDirectory(url:self.url.directoryUrl)
        try self.makeDirectory(url:self.url.projectsUrl)
    }
    /*
    func boardData() throws -> Data {
        return try self.dataAtUrl(url:self.user)
    }*/
    
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
    }/*
    
    func loadProjects() throws -> [Data] {
        let urls:[URL] = try self.projectUrls()
        guard
            urls.isEmpty == false
            else { throw ErrorRepository.noProjectsFound }
        return try self.projectsWith(urls:urls)
    }
    
    private func loadFileAt(url:URL) throws -> Data {
        guard
            FileManager.default.fileExists(atPath:url.path)
            else { throw ErrorRepository.fileNotFound }
        return try Data(contentsOf:url)
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
    }*/
}
