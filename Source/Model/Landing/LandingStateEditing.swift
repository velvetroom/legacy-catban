import Foundation

class LandingStateEditing:LandingState {
    var indexPath:IndexPath
    
    override init() {
        self.indexPath = IndexPath(item:0, section:0)
        super.init()
    }
}
