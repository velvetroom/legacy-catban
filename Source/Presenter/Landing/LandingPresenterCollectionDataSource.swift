import UIKit

class LandingPresenterCollectionDataSource:NSObject, UICollectionViewDataSource {
    weak var delegate:LandingPresenterCollectionDataSourceProtocol?
    var viewModel:LandingViewModelCollection
    
    override init() {
        self.viewModel = LandingViewModelCollection()
        super.init()
    }
    
    func configure(header:LandingViewCollectionHeader, for section:Int) {
        let viewModel:LandingViewModelCollectionSection = self.viewModelFor(section:section)
        header.labelTitle.text = viewModel.title
    }
    
    func configure(cell:LandingViewCollectionCell, for index:IndexPath) {
        let viewModel:LandingViewModelCollectionItem = self.viewModelFor(index:index)
        cell.labelTitle.text = viewModel.title
        cell.configureState()
    }
    
    private func viewModelFor(section:Int) -> LandingViewModelCollectionSection {
        return self.viewModel.sections[section]
    }
    
    private func viewModelFor(index:IndexPath) -> LandingViewModelCollectionItem {
        return self.viewModel.sections[index.section].items[index.item]
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
    
    func collectionView(_ collection:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        return self.dequeueCellFrom(collection:collection, at:index)
    }
    
    private func dequeueHeaderFrom(collection:UICollectionView, at index:IndexPath) -> UICollectionReusableView {
        let header:LandingViewCollectionHeader = collection.dequeueReusableSupplementaryView(
            ofKind:UICollectionElementKindSectionHeader,
            withReuseIdentifier:LandingViewCollectionHeader.reusableIdentifier,
            for:index) as! LandingViewCollectionHeader
        self.configure(header:header, for:index.section)
        return header
    }
    
    private func dequeueCellFrom(collection:UICollectionView, at index:IndexPath) -> UICollectionViewCell {
        let cell:LandingViewCollectionCell  = collection.dequeueReusableCell(
            withReuseIdentifier:LandingViewCollectionCell.reusableIdentifier,
            for:index) as! LandingViewCollectionCell
        self.configure(cell:cell, for:index)
        return cell
    }
    
    func collectionView(_:UICollectionView, moveItemAt source:IndexPath, to destination:IndexPath) {
        self.delegate?.moveItemFrom(origin:source, to:destination)
    }
    
    func collectionView(_:UICollectionView, canMoveItemAt index:IndexPath) -> Bool {
        return true
    }
}
