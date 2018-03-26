import UIKit

class LandingCollectionDelegate:NSObject, LandingCollectionDelegateProtocol {
    var viewModel:LandingViewModelCollection
    
    override init() {
        self.viewModel = LandingViewModelCollection()
        super.init()
    }
    
    func numberOfSections(in:UICollectionView) -> Int {
        return self.viewModel.sections.count
    }
    
    func collectionView(_:UICollectionView, numberOfItemsInSection section:Int) -> Int {
        guard
            section < self.viewModel.sections.count
        else {
            return 0
        }
        return self.viewModel.sections[section].items.count
    }
    
    func collectionView(_ collection:UICollectionView, viewForSupplementaryElementOfKind kind:String,
                        at index:IndexPath) -> UICollectionReusableView {
        return self.dequeueHeaderFrom(collection:collection, at:index)
    }
    
    func collectionView(_:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    private func dequeueHeaderFrom(collection:UICollectionView, at index:IndexPath) -> UICollectionReusableView {
        let header:LandingViewCollectionHeader = collection.dequeueReusableSupplementaryView(
            ofKind:UICollectionElementKindSectionHeader,
            withReuseIdentifier:LandingViewCollectionHeader.reusableIdentifier,
            for:index) as! LandingViewCollectionHeader
        return header
    }
}
