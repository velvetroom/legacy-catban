import UIKit

class ViewListFlow:UICollectionViewFlowLayout {
    override init() {
        super.init()
        self.scrollDirection = UICollectionViewScrollDirection.vertical
        self.headerReferenceSize = CGSize.zero
        self.footerReferenceSize = CGSize.zero
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}