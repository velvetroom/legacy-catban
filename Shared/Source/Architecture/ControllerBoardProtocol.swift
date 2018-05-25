import Foundation
import Board

public protocol ControllerBoardProtocol:ControllerProjectProtocol {
    var board:BoardProjectsProtocol! { get set }
}
