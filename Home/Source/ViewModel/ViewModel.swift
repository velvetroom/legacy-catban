import UIKit

struct ViewModel {
    var view:ViewModelView
    var columns:[ViewModelColumn]
    
    init() {
        self.view = ViewModelView()
        self.columns = []
    }
}
