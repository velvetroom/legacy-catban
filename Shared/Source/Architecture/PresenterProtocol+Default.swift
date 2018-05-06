import Foundation

public extension PresenterProtocol {
    var viewType:View.Type {
        get {
            return View.self
        }
    }
    
    var view:View {
        get {
            let view:View = View()
            view.delegate = self
            return view
        }
    }
    
    func viewDidLoad() {
        self.delegate.viewDidLoad()
    }
}
