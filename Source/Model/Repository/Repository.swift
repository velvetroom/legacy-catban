import Foundation

class Repository:RepositoryProtocol {
    var local:RepositoryLocalProtocol
    
    init() {
        self.local = RepositoryLocal()
    }
}
