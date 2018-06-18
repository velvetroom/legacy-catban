import UIKit

extension Presenter {
    var view:ViewList {
        get {
            let view:ViewContent = self.presenting!.viewController.view as! ViewContent
            return view.viewList
        }
    }
    
    func selectFirstItem() {
        let viewModel:ViewModelList = self.viewModel.property()
        self.selected = 0
        if viewModel.items.isEmpty == false {
            self.selectCurrent()
        }
    }
    
    private func selectCurrent() {
        self.view.selectItem(at:IndexPath(item:self.selected, section:0), animated:true,
                             scrollPosition:UICollectionViewScrollPosition.centeredVertically)
    }
}
