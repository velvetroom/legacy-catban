import UIKit

class LandingViewCollection:UICollectionView {
    var draw:Bool = true
    init(layout:UICollectionViewLayout = UICollectionViewLayout()) {
        super.init(frame:CGRect.zero, collectionViewLayout:layout)
        self.configureView()
        self.registerViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func clearSelection() {
        self.selectItem(at:nil, animated:true, scrollPosition:UICollectionViewScrollPosition())
    }
    
    private func configureView() {
        self.backgroundColor = UIColor.clear
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.alwaysBounceVertical = true
        self.alwaysBounceHorizontal = true
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.bouncesZoom = false
        self.decelerationRate = UIScrollViewDecelerationRateFast
        self.insetsLayoutMarginsFromSafeArea = true
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.always
    }
    
    private func registerViews() {
        self.register(LandingViewCollectionHeader.self,
                      forSupplementaryViewOfKind:UICollectionElementKindSectionHeader,
                      withReuseIdentifier:LandingViewCollectionHeader.reusableIdentifier)
        self.register(LandingViewCollectionCell.self,
                      forCellWithReuseIdentifier:LandingViewCollectionCell.reusableIdentifier)
    }
    
    override func beginInteractiveMovementForItem(at indexPath:IndexPath) -> Bool {
        self.delegate?.collectionView?(self, didDeselectItemAt:IndexPath(item:0, section:0))
        self.clearSelection()
        
        return super.beginInteractiveMovementForItem(at:indexPath)
    }
    
    override func reloadItems(at indexPaths:[IndexPath]) {
        super.reloadItems(at:indexPaths)
        self.selectItem(at:indexPaths.first, animated:false, scrollPosition:UICollectionViewScrollPosition())
    }
}
