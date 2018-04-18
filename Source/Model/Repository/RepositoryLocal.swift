import Foundation

class RepositoryLocal:RepositoryLocalProtocol {
    var file:FileProtocol
    var deserialiser:DeserialiserProtocol
    
    init() {
        self.file = File()
        self.deserialiser = Deserialiser()
    }
}
