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
        self.delegate.didLoadPresenter()
    }
    
    func shouldUpdate() { }
}
