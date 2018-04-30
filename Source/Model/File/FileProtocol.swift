import Foundation

protocol FileProtocol {
    func loadUser() throws -> Data
    func loadProjects() throws -> [Data]
    func save(user:Data) throws
    func save(project:Data, with identifier:String) throws
    func deleteProjectWith(identifier:String) throws
}
