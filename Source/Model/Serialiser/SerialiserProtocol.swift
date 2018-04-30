import Foundation

protocol SerialiserProtocol {
    func serialise(user:UserProtocol) throws -> Data
    func serialise(project:ProjectProtocol) throws -> Data
}
