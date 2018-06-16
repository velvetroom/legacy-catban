import Foundation

public extension PresenterProtocol {
    var transition:TransitionProtocol? {
        get {
            return self.presenting?.transition
        }
    }
    
    func didLoad() { }
    func willAppear() { }
    func didAppear() { }
    func orientationChanged() { }
}
