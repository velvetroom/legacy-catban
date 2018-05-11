import Foundation

struct ViewModel {
    var view:ViewModelView
    var text:ViewModelText
    
    init() {
        self.view = ViewModelView()
        self.text = ViewModelText()
    }
}
