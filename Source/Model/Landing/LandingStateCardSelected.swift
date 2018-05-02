import Foundation

class LandingStateCardSelected:LandingState {
    var indexPath:IndexPath
    
    override init() {
        self.indexPath = IndexPath(item:0, section:0)
        super.init()
    }
    
    override func moveCardLeft() {
        let newIndex:IndexPath = self.delegate.project.indexOnLeftForCardAt(index:self.indexPath)
        self.delegate.moveCardFrom(origin:self.indexPath, to:newIndex)
        self.indexPath = newIndex
    }
}
