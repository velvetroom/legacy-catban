import Foundation

public protocol ProjectProtocol:class,
    IdentifierProtocol,
    CreatedProtocol,
    ProjectColumnsProtocol,
    CardManagerProtocol {
    var name:String { get set }
    
    func copy(project:ProjectProtocol)
}
