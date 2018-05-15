import Foundation

protocol PresenterDragStrategyCardDropProtocol {
    var state:PresenterDragStrategyCardStateDragging! { get set }
    
    func endDragging()
}
