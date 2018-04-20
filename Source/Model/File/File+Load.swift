import Foundation

extension File {
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