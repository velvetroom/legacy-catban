import Foundation

public protocol ProjectProtocol:
    IdentifierProtocol,
    CreatedProtocol,
    ContainerProtocol,
    ProjectColumnsProtocol,
    CardManagerProtocol {
    
    func copy(project:ProjectProtocol)
}
