import UIKit

class OrganiseViewCollection:UICollectionView {
    init() {
        let layout:UICollectionViewLayout = OrganiseViewCollection.factoryLayout()
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
        self.register(OrganiseViewCollectionCell.self,
                      forCellWithReuseIdentifier:OrganiseViewCollectionCell.reusableIdentifier)
    }
}
