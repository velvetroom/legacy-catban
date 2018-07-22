import Foundation

extension Presenter {
    func selectCurrentItem() {
        let viewModel:ViewModelList = self.viewModel.property()
        if viewModel.items.isEmpty == false {
            if let identifier:String = self.state.selected {
                self.selectItemWith(identifier:identifier, from:viewModel)
            } else {
                self.selectItemAt(index:0)
            }
        }
    }
    
    private func selectItemWith(identifier:String, from viewModel:ViewModelList) {
        var index:Int = 0
        let countItems:Int = viewModel.items.count
        for indexItem:Int in 0 ..< countItems {
            if viewModel.items[indexItem].identifier == identifier {
                index = indexItem
                break
            }
        }
        self.selectItemAt(index:index)
    }
    
    private func selectItemAt(index:Int) {
        var viewModel:ViewModelSelected = self.viewModel.property()
        viewModel.indexPath = IndexPath(item:index, section:0)
        self.viewModel.update(property:viewModel)
        self.stateSelectAt(index:index)
    }
    
    private func stateSelectAt(index:Int) {
        let viewModel:ViewModelList = self.viewModel.property()
        self.state.selected = viewModel.items[index].identifier
    }
}
