import UIKit

class PresenterList {
    let delegate:PresenterListDelegate
    let datasource:PresenterListDatasource
    var selected:ViewModelListItem {
        get {
            return self.items[self.delegate.selected.item]
        }
    }
    
    var items:[ViewModelListItem] {
        get {
            return self.datasource.items
        }
        set(newValue) {
            self.datasource.items = newValue
            self.view?.reloadData()
        }
    }
    
    weak var view:ViewList? {
        get {
            return self.delegate.view
        }
        set(newValue) {
            self.delegate.view = newValue
            newValue?.delegate = self.delegate
            newValue?.dataSource = self.datasource
        }
    }
    
    init() {
        self.delegate = PresenterListDelegate()
        self.datasource = PresenterListDatasource()
    }
    
    func updateWith(viewModel:ViewModelProtocol) {
        if let viewModel:ViewModelList = viewModel as? ViewModelList {
            self.items = viewModel.items
        } else {
            self.items = []
        }
        self.selectFirstItem()
    }
    
    func selectItemWith(identifier:String) {
        var itemIndex:Int = 0
        let count:Int = self.items.count
        for index:Int in 0 ..< count {
            if self.items[index].identifier == identifier {
                itemIndex = index
                break
            }
        }
        self.delegate.selected = IndexPath(item:itemIndex, section:0)
        self.selectAnimating()
    }
    
    private func selectFirstItem() {
        guard
            self.items.isEmpty == false
            else { return }
        self.delegate.selected = IndexPath(item:0, section:0)
        self.selectAnimating()
    }
    
    private func selectAnimating() {
        self.view?.selectItem(at:self.delegate.selected, animated:true,
                              scrollPosition:UICollectionViewScrollPosition.centeredVertically)
    }
}
