import Foundation
import Board

class Deserialise:DeserialiseProtocol {
    func deserialise(board:Data) throws -> BoardProtocol {
        throw ErrorSerial.corruptedData
    }
}
