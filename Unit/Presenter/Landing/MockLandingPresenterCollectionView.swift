import UIKit

class MockLandingPresenterCollectionView:UICollectionView {
    var returnIndexPath:IndexPath?
    var returnCell:UICollectionViewCell?
    var onBeginMovement:(() -> Void)?
    var onCancelMovement:(() -> Void)?
    var onEndMovement:(() -> Void)?
    var onUpdateMovement:(() -> Void)?
    
    init() {
        super.init(frame:CGRect.zero, collectionViewLayout:UICollectionViewLayout())
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func indexPathForItem(at point:CGPoint) -> IndexPath? {
        return self.returnIndexPath
    }
    
    override func cellForItem(at indexPath:IndexPath) -> UICollectionViewCell? {
        return self.returnCell
    }
    
    override func beginInteractiveMovementForItem(at indexPath:IndexPath) -> Bool {
        self.onBeginMovement?()
        return true
    }
    
    override func cancelInteractiveMovement() {
        self.onCancelMovement?()
    }
    
    override func endInteractiveMovement() {
        self.onEndMovement?()
    }
    
    override func updateInteractiveMovementTargetPosition(_ targetPosition:CGPoint) {
        self.onUpdateMovement?()
    }
}
