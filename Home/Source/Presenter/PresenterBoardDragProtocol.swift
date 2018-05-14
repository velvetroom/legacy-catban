import UIKit

protocol PresenterBoardDragProtocol:class {
    func updated(state:PresenterBoardDragState, at position:CGPoint)
}
