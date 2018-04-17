import Foundation

class RepositoryLocal:RepositoryLocalProtocol {
    var file:FileProtocol
    
    init() {
        self.file = File()
    }
}
