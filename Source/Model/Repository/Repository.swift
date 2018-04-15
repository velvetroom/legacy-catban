import Foundation

class Repository:RepositoryProtocol {
    var local:LocalProtocol
    
    init() {
        self.local = Local()
    }
}
