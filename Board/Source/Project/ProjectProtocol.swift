import Foundation

public protocol ProjectProtocol:
    IdentifierProtocol,
    CreatedProtocol,
    ContainerProtocol,
    ColumnManagerProtocol,
    CardManagerProtocol,
    ProjectOrderProtocol {
    
    func copy(project:ProjectProtocol)
}
