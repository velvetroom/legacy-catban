import UIKit

class ViewListFlow:UICollectionViewFlowLayout {
    override init() {
        super.init()
        self.scrollDirection = UICollectionViewScrollDirection.vertical
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
