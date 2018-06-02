import Foundation

class PresenterOutletsLoader {
    var outlets:PresenterOutlets
    weak var view:View!
    
    init() {
        self.outlets = PresenterOutlets()
    }
    
    func load() {
        let viewBase:ViewBase = self.view.viewBase
        self.outlets.view = self.view
        self.outlets.list = viewBase.viewList
        self.outlets.selector = viewBase.viewSelector
        self.outlets.menu = viewBase.viewMenu
        self.outlets.empty = viewBase.viewEmpty
        self.outlets.renamer = viewBase.viewRenamer
    }
}
