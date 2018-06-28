import Foundation

public protocol ProjectProtocol:
    IdentifierProtocol,
    CreatedProtocol,
    ContainerProtocol,
    ColumnManagerProtocol,
    CardManagerProtocol,
    ProjectOrderProtocol {
    
    var board:BoardProtocol? { get set }
    
    func copy(project:ProjectProtocol)
}
