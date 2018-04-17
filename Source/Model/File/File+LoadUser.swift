import Foundation

extension File {
    func loadUser() throws -> Data {
        throw ErrorRepository.fileNotFound
    }
}
