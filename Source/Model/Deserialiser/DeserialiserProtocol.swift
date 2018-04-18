import Foundation

protocol DeserialiserProtocol {
    func deserialise(user:Data) throws -> UserProtocol
    func deserialise(project:Data) throws -> ProjectProtocol
}
