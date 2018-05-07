import Foundation

public protocol BoardProjectsProtocol {
    var countProjects:Int { get }
    
    func manage(project:ProjectProtocol) -> ProjectManagedProtocol
    func unmanage(project:ProjectManagedProtocol)
    func add(project:ProjectProtocol)
    func remove(project:ProjectProtocol)
}
