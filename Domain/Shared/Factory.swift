import Foundation

public class Factory {
    public class func makeLibrary() -> LibraryProtocol {
        return Library()
    }
    
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
