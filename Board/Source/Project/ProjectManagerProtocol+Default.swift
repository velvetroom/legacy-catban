import Foundation

public extension ProjectManagerProtocol {
    func add(project:ProjectProtocol) { }
    func remove(project:ProjectProtocol) { }
    func iterate(projects:((ProjectProtocol) -> Void)) { }
    
    func projectWith(identifier:String) -> ProjectProtocol {
        fatalError("Method not implemented")
    }
}
