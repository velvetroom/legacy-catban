import Foundation

public protocol ProjectManagedProtocol:ProjectProtocol {
    var manager:ProjectManagerProtocol { get set }
}
