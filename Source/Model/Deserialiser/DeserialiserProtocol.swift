import Foundation

protocol DeserialiserProtocol {
    func deserialise(user:Data) throws -> UserProtocol
}
