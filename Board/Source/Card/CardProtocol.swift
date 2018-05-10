import Foundation

public protocol CardProtocol:class, IdentifierProtocol, CreatedProtocol {
    var content:String { get set }
}
