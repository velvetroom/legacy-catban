import Foundation

public protocol ProjectProtocol:class, IdentifierProtocol, CreatedProtocol, ProjectColumnsProtocol {
    var name:String { get set }
    
    func copy(project:ProjectProtocol)
}
