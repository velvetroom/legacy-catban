import Foundation
import Board

protocol DeserialiseProtocol {
    var data:Data! { get set }
    
    func makeBoard() throws -> BoardProtocol
    func makeProject() throws -> ProjectProtocol
}
