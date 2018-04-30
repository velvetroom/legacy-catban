import Foundation

struct LandingViewModelCollectionSection {
    var items:[LandingViewModelCollectionItem]
    var title:String
    
    init() {
        self.items = []
        self.title = String()
    }
}
