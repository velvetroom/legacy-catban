import UIKit

extension Presenter {
    var view:ViewList {
        get {
            let view:ViewBase = self.presenting!.viewController.view as! ViewBase
            return view.viewList
        }
    }
    
    func selectItemWith(identifier:String) {
        let items:[ViewModelItem] = self.viewModel.items
        for index:Int in 0 ..< items.count {
            if items[index].identifier == identifier {
                self.interactor.stateSelecting(index:index)
                break
            }
        }
        self.selectAnimating()
    }
    
    func selectFirstItem() {
        guard
            self.viewModel.items.isEmpty == false
        else { return }
        self.interactor.stateSelecting(index:0)
        self.selectAnimating()
    }
    
    private func selectAnimating() {
        self.view.selectItem(at:self.interactor.state.selected, animated:true,
                             scrollPosition:UICollectionViewScrollPosition.centeredVertically)
    }
}
