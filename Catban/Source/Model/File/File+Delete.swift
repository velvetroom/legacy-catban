import Foundation

extension File {
    func deleteAll() {
        do { try FileManager.default.removeItem(at:self.directory) } catch { }
    }
    
    func deleteProjectWith(identifier:String) throws {
        let url:URL = self.urlForProject(identifier:identifier)
        if FileManager.default.fileExists(atPath:url.path) {
            try FileManager.default.removeItem(at:url)
        }
    }
}
