import Foundation

protocol FileProtocol {
    func loadUser() throws -> Data
    func loadProjects() throws -> [Data]
}
