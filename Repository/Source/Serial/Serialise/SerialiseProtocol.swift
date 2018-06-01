import Foundation
import Board

protocol SerialiseProtocol {
    func makeDataFrom(board:BoardProtocol) throws -> Data
    func makeDataFrom(project:ProjectProtocol) throws -> Data
}
