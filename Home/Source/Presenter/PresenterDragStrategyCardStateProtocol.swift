import Foundation

protocol PresenterDragStrategyCardStateProtocol {
    var strategy:PresenterDragStrategyCard! { get set }
    
    func moved()
    func endDragging()
}
