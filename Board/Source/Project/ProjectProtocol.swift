import Foundation

public protocol ProjectProtocol:
    IdentifierProtocol,
    CreatedProtocol,
    ContainerProtocol,
    ProjectColumnsProtocol,
    CardManagerProtocol,
    ProjectOrderProtocol {
    
    func copy(project:ProjectProtocol)
}
