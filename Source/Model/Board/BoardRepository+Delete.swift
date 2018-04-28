import Foundation

extension BoardRepository {
    func delete(project:ProjectProtocol) {
        self.dispatchQueue.async { [weak self] in
            do { try self?.repository.localDelete(project:project) } catch { }
        }
    }
}
