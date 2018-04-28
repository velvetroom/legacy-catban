import Foundation

extension File {
    func clearProjects() throws {
        try FileManager.default.removeItem(at:self.projects)
    }
    
    func deleteProjectWith(identifier:String) throws {
        let url:URL = self.urlForProject(identifier:identifier)
        if FileManager.default.fileExists(atPath:url.path) {
            try FileManager.default.removeItem(at:url)
        }
    }
}
