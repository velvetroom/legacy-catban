import UIKit
@testable import catban

class MockCollectionViewDelegate:NSObject, UICollectionViewDelegate {
    var onDidDeselectItem:(() -> Void)?
    
    func collectionView(_ collectionView:UICollectionView, didDeselectItemAt indexPath:IndexPath) {
        self.onDidDeselectItem?()
    }
}
