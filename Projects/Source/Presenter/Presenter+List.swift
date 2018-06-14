import UIKit

extension Presenter {
    var view:ViewList {
        get {
            let view:ViewBase = self.presenting!.viewController.view as! ViewBase
            return view.viewList
        }
    }
    
    func selectFirstItem() {
        guard
            self.viewModel.items.isEmpty == false,
            let item:ViewModelItem = self.viewModel.items.first
        else { return }
        self.interactor.stateSelecting(index:0, identifier:item.identifier)
        self.selectCurrentOnView()
    }
    
    private func selectCurrentOnView() {
        self.interactor.state.selectCurrentOn(view:self.view)
    }
}
