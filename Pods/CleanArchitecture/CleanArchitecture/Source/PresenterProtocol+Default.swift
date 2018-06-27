import Foundation

public extension PresenterProtocol {
    func didLoad() { }
    func willAppear() { }
    func didAppear() { }
    func orientationChanged() { }
    
    func shouldTransition<Transition>(completion:((Transition?) -> Void)) {
        completion(self.transition as? Transition)
    }
}
