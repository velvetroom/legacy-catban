import UIKit

extension Presenter {
    var view:ViewList {
        get {
            let view:ViewBase = self.presenting!.viewController.view as! ViewBase
            return view.viewList
        }
    }
    
    func selectItemWith(identifier:String) {
        var itemIndex:Int = 0
        let items:[ViewModelItem] = self.viewModel.items
        for index:Int in 0 ..< items.count {
            if items[index].identifier == identifier {
                itemIndex = index
                break
            }
        }
        self.selected = IndexPath(item:itemIndex, section:0)
        self.selectAnimating()
    }
    
    func selectFirstItem() {
        guard
            self.viewModel.items.isEmpty == false
        else { return }
        self.selected = IndexPath(item:0, section:0)
        self.selectAnimating()
    }
    
    private func selectAnimating() {
        self.view.selectItem(at:self.selected, animated:true,
                             scrollPosition:UICollectionViewScrollPosition.centeredVertically)
    }
}
