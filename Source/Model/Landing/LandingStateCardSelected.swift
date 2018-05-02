import Foundation

class LandingStateCardSelected:LandingState {
    var indexPath:IndexPath
    
    override init() {
        self.indexPath = IndexPath(item:0, section:0)
        super.init()
    }
    
    override func moveCardLeft() {
        let indexPath:IndexPath = self.delegate.project.indexOnLeftForCardAt(index:self.indexPath)
        self.moveCardTo(indexPath:indexPath)
    }
    
    override func moveCardRight() {
        let indexPath:IndexPath = self.delegate.project.indexOnRightForCardAt(index:self.indexPath)
        self.moveCardTo(indexPath:indexPath)
    }
    
    private func moveCardTo(indexPath:IndexPath) {
        self.delegate.moveCardFrom(origin:self.indexPath, to:indexPath)
        self.indexPath = indexPath
    }
}
