import Foundation

public class Factory {
    class func makeSession() -> SessionProtocol {
        return Configuration.Session()
    }
    
    class func makeBoard() -> BoardProtocol {
        return Configuration.Board()
    }
    
    class func makeRepository() -> RepositoryProtocol {
        return Configuration.repository.init()
    }
    
    private init() { }
}
