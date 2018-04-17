import Foundation

extension File {
    func loadProjects() throws -> [Data] {
        throw ErrorRepository.fileNotFound
    }
}
