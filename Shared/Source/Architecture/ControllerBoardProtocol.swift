import Foundation
import Board

public protocol ControllerBoardProtocol:ControllerProtocol {
    var board:BoardProjectsProtocol! { get set }
}
