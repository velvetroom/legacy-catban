import Foundation

public struct Configuration:ConfigurationProtocol {
    typealias BoardType = Board_v1
    
    public static var repositoryType:RepositoryProtocol.Type!
}

private protocol ConfigurationProtocol {
    associatedtype BoardType:BoardProtocol
}
