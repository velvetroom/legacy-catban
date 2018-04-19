import Foundation

protocol FileProtocol {
    var directory:URL { get set }
    var projects:URL { get }
    
    func loadUser() throws -> Data
    func loadProjects() throws -> [Data]
    func save(user:UserProtocol) throws
    func save(projects:[ProjectProtocol]) throws
}
