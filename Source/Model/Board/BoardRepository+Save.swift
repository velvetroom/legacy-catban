import Foundation

extension BoardRepository {
    func save(board:BoardProtocol) {
        self.dispatchQueue.async { [weak self] in
            do { try self?.repository.localSave(board:board) } catch { }
        }
    }
}
