import Foundation
import Board

class Serialise:SerialiseProtocol {
    func serialise(board:BoardProtocol) throws -> Data {
        throw ErrorRepository.corruptedData
    }
}
