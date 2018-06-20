import UIKit

extension View {
    func configureViewModel() {
        self.configureContentViewModel()
        self.configureListViewModel()
        self.configureSelectorViewModel()
        self.configureSelectedViewModel()
    }
    
    private func configureContentViewModel() {
        var viewModel:ViewModelContent = ViewModelContent()
        viewModel.observing = self.updated
        self.viewModel.update(property:viewModel)
    }
    
    private func configureListViewModel() {
        var viewModel:ViewModelList = ViewModelList()
        viewModel.observing = self.updated
        self.viewModel.update(property:viewModel)
    }
    
    private func configureSelectorViewModel() {
        var viewModel:ViewModelSelector = ViewModelSelector()
        viewModel.observing = self.updated
        self.viewModel.update(property:viewModel)
    }
    
    private func configureSelectedViewModel() {
        var viewModel:ViewModelSelected = ViewModelSelected()
        viewModel.observing = self.updated
        self.viewModel.update(property:viewModel)
    }
    
    private func updated(viewModel:ViewModelContent) {
        self.content.viewEmpty.isHidden = viewModel.emptyHidden
        self.content.viewList.isHidden = viewModel.listHidden
    }
    
    private func updated(viewModel:ViewModelList) {
        self.content.viewList.reloadData()
    }
    
    private func updated(viewModel:ViewModelSelector) {
        self.content.viewSelector.layoutY.constant = viewModel.positionY
        UIView.animate(withDuration:ViewConstants.Selector.animateDuration) { [weak self] in
            self?.content.layoutIfNeeded()
        }
    }
    
    private func updated(viewModel:ViewModelSelected) {
        self.content.viewList.selectItem(at:viewModel.indexPath, animated:true,
                                         scrollPosition:UICollectionViewScrollPosition.centeredVertically)
    }
}
