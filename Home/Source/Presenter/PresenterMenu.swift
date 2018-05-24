import Foundation
import Shared

class PresenterMenu {
    weak var view:Shared.View!
    weak var controller:Controller!
    
    required init() { }
    
    func show() {
        let menu:ViewMenu = ViewMenu()
        self.view.present(menu, animated:true, completion:nil)
    }
}
