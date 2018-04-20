import UIKit
@testable import catban

class MockOrganisePresenterCollectionDatasourceProtocol:NSObject, OrganisePresenterCollectionDatasourceProtocol {
    var viewModel:OrganiseViewModelCollection
    var numberOfItems:Int
    var cell:UICollectionViewCell
    
    override init() {
        self.viewModel = OrganiseViewModelCollection()
        self.numberOfItems = 0
        self.cell = UICollectionViewCell()
    }
    
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        return self.numberOfItems
    }
    
    func collectionView(_:UICollectionView, cellForItemAt:IndexPath) -> UICollectionViewCell {
        return self.cell
    }
}
