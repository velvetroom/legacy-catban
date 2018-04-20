import UIKit

class OrganisePresenterCollectionDatasource:NSObject, OrganisePresenterCollectionDatasourceProtocol {
    var viewModel:OrganiseViewModelCollection
    
    override init() {
        self.viewModel = OrganiseViewModelCollection()
    }
    
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        return self.viewModel.items.count
    }
    
    func collectionView(_:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
