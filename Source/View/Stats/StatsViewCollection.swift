import UIKit

class StatsViewCollection:UICollectionView {
    init() {
        let layout:UICollectionViewFlowLayout = StatsViewCollection.factoryLayout()
        super.init(frame:CGRect.zero, collectionViewLayout:layout)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.alwaysBounceVertical = false
        self.alwaysBounceHorizontal = true
        self.register(StatsViewCollectionCell.self,
                      forCellWithReuseIdentifier:StatsViewCollectionCell.reusableIdentifier)
    }
}
