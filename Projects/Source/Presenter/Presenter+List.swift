import UIKit

extension Presenter {
    var view:ViewList {
        get {
            let view:ViewContent = self.presenting!.viewController.view as! ViewContent
            return view.viewList
        }
    }
    
    func selectFirstItem() {
        guard
            self.viewModel.items.isEmpty == false
        else { return }
        self.selected = 0
        self.selectCurrent()
    }
    
    private func selectCurrent() {
        self.view.selectItem(at:IndexPath(item:self.selected, section:0), animated:true,
                             scrollPosition:UICollectionViewScrollPosition.centeredVertically)
    }
}
