import Foundation

protocol BoardProtocol {
    var project:ProjectProtocol { get set }
    var user:UserProtocol { get set }
    var projects:[ProjectProtocol] { get set }
    
    func selectProjectAt(index:Int)
    func insertProject(project:ProjectProtocol)
    func deleteProject()
    func apply(updates:[UpdateProtocol])
    func saveProject()
}
