import Foundation
import Board

protocol DeserialiseProtocol {
    func deserialise(board:Data) throws -> BoardProtocol
}
