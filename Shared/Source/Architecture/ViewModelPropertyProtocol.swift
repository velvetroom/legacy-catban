import Foundation

public protocol ViewModelPropertyProtocol {
    var observer:ViewModelObserverProtocol? { get set }
}
