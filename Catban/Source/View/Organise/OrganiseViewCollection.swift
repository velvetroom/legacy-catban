import UIKit

class OrganiseViewCollection:UICollectionView {
    init() {
        let layout:UICollectionViewFlowLayout = OrganiseViewCollection.factoryLayout()
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
        self.alwaysBounceVertical = true
        self.register(OrganiseViewCollectionCell.self,
                      forCellWithReuseIdentifier:OrganiseViewCollectionCell.reusableIdentifier)
    }
}
