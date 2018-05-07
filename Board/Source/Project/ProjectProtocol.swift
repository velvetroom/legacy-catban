import Foundation

public protocol ProjectProtocol:IdentifierProtocol, CreatedProtocol, ProjectColumnsProtocol {
    var name:String { get set }
}
