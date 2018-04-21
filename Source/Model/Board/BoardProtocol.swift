import Foundation

protocol BoardProtocol {
    var project:ProjectProtocol { get set }
    var user:UserProtocol { get set }
    var projects:[ProjectProtocol] { get set }
    
    func deleteProject()
}
