import Foundation

public protocol ProjectManagedProtocol:ProjectProtocol {
    var manager:BoardProjectsProtocol { get set }
}
