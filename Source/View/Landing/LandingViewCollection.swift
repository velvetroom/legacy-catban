import UIKit

class LandingViewCollection:UICollectionView {
    init() {
        let layout:UICollectionViewFlowLayout = LandingViewCollection.factoryLayout()
        super.init(frame:CGRect.zero, collectionViewLayout:layout)
        self.backgroundColor = UIColor.clear
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
