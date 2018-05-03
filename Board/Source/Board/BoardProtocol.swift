import Foundation

protocol BoardProtocol {
    var project:ProjectProtocol { get set }
    
    func selectProjectAt(index:Int)
    func insertProject(project:ProjectProtocol)
    func deleteProject()
    func saveProject()
    func saveUser()
}
