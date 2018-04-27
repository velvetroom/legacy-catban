import Foundation

extension File {
    func clearProjects() throws {
        try FileManager.default.removeItem(at:self.projects)
    }
}
