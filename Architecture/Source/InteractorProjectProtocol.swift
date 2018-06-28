import Foundation
import Board

public protocol InteractorProjectProtocol:InteractorBoardProtocol {
    var project:ProjectProtocol! { get set }
}
