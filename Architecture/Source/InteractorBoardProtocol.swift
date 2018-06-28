import Foundation
import CleanArchitecture
import Board

public protocol InteractorBoardProtocol:InteractorProtocol {
    var board:ProjectManagerProtocol! { get set }
}
