import Foundation

public extension PresenterProtocol {
    var view:View {
        get {
            return View()
        }
    }
    
    func viewDidLoad() {
        self.delegate.viewDidLoad()
    }
}
