import Foundation

extension BoardRepository {
    func save(project:ProjectProtocol) {
        self.dispatchQueue.async { [weak self] in
            do { try self?.repository.save(project:project) } catch { }
        }
    }
    
    func save(user:UserProtocol) {
        self.dispatchQueue.async { [weak self] in
            do { try self?.repository.save(user:user) } catch { }
        }
    }
}
