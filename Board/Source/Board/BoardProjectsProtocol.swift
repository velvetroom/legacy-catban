import Foundation

public protocol BoardProjectsProtocol:class {
    var countProjects:Int { get }
    var firstProject:ProjectProtocol? { get }
    
    func manage(project:ProjectProtocol) -> ProjectManagedProtocol
    func unmanage(project:ProjectManagedProtocol)
    func projectWith(identifier:String) -> ProjectProtocol
    func add(project:ProjectProtocol)
    func remove(project:ProjectProtocol)
    func iterate(projects:((ProjectProtocol) -> Void))
}
