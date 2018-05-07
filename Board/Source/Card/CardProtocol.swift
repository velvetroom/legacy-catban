import Foundation

public protocol CardProtocol:IdentifierProtocol, CreatedProtocol {
    var content:String { get set }
}
