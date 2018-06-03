import Foundation
import Shared

class PresenterOutletsLoader {
    weak var view:Shared.View!
    private var outlets:PresenterOutlets
    
    init() {
        self.outlets = PresenterOutlets()
    }
    
    func loadOutlets() -> PresenterOutlets {
        let view:View = self.view as! View
        outlets.view = view
        outlets.viewField = view.viewBase.viewInput.field
        return self.outlets
    }
}
