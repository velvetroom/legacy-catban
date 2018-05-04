import Foundation
import Board

protocol SerialiseProtocol {
    func serialise(board:BoardProtocol) throws -> Data
}
