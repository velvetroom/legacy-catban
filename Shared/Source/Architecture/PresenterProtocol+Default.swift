import Foundation

public extension PresenterProtocol {
    var viewType:View.Type {
        get {
            return View.self
        }
    }
    
    var view:View {
        get {
            let view:View = self.viewType.init()
            view.delegate = self
            return view
        }
    }
    
    func didLoad(view:Shared.View) {
        self.presenterDidLoadWith(view:view)
        self.delegate.didLoadPresenter()
    }
    
    func presenterDidLoadWith(view:View) { }
    func shouldUpdate() { }
}
