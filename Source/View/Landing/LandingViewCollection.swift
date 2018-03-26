import UIKit

class LandingViewCollection:UICollectionView {
    init(layout:UICollectionViewLayout = UICollectionViewLayout()) {
        super.init(frame:CGRect.zero, collectionViewLayout:layout)
        self.configureView()
        self.registerViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.backgroundColor = UIColor.clear
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.alwaysBounceVertical = true
        self.alwaysBounceHorizontal = true
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.decelerationRate = UIScrollViewDecelerationRateFast
    }
    
    private func registerViews() {
        self.register(LandingViewCollectionHeader.self,
                      forSupplementaryViewOfKind:UICollectionElementKindSectionHeader,
                      withReuseIdentifier:LandingViewCollectionHeader.reusableIdentifier)
        self.register(LandingViewCollectionCell.self,
                      forCellWithReuseIdentifier:LandingViewCollectionCell.reusableIdentifier)
    }
}
