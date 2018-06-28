import Foundation

public protocol ProjectManagerProtocol:class {
    var countProjects:Int { get }
    var firstProject:ProjectProtocol? { get }
    
    func projectWith(identifier:String) -> ProjectProtocol
    func add(project:ProjectProtocol)
    func remove(project:ProjectProtocol)
    func iterate(projects:((ProjectProtocol) -> Void))
}