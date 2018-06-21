import UIKit

class MockCollectionViewDelegate:NSObject, UICollectionViewDelegate {
    var onScrollDidScroll:(() -> Void)?
    
    func scrollViewDidScroll(_ scrollView:UIScrollView) {
        self.onScrollDidScroll?()
    }
}
