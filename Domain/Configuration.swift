import Foundation

public struct Configuration:ConfigurationProtocol {
    typealias SessionType = Session_v1
    typealias BoardType = Board_v1
    
    public static var libraryType:LibraryProtocol.Type = Library.self
    public static var repositoryType:RepositoryProtocol.Type!
}

private protocol ConfigurationProtocol {
    associatedtype SessionType:SessionProtocol
    associatedtype BoardType:BoardProtocol
}
