import Foundation

public protocol BoardProjectsProtocol {
    var countProjects:Int { get }
    
    func manage(project:ProjectProtocol) -> ProjectManagedProtocol
    func add(project:ProjectProtocol)
}
