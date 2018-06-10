import Foundation
import Board

public protocol InteractorBoardProtocol:InteractorProtocol {
    var board:BoardProjectsProtocol! { get set }
}
