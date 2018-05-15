import Foundation

protocol PresenterDragStrategyCardDropProtocol {
    var state:PresenterDragStrategyCardStateDragging! { get set }
    
    func moved()
    func endDragging()
}
