import Foundation

public protocol CardProtocol:class,
    IdentifierProtocol,
    CreatedProtocol,
    ContainedProtocol {
    var content:String { get set }
}
