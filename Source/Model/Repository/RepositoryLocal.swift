import Foundation

class RepositoryLocal:RepositoryLocalProtocol {
    var file:FileProtocol
    var deserialiser:DeserialiserProtocol
    var serialiser:SerialiserProtocol
    
    init() {
        self.file = File()
        self.deserialiser = Deserialiser()
        self.serialiser = Serialiser()
    }
}
