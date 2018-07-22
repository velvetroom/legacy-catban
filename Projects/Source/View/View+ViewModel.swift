import UIKit

extension View {
    func configureViewModel() {
        self.configureContentViewModel()
        self.configureListViewModel()
        self.configureSelectorViewModel()
        self.configureSelectedViewModel()
    }
    
    private func configureContentViewModel() {
        var viewModel:ViewModelContent = self.viewModel.property()
        viewModel.observing = { [weak self] (property:ViewModelContent) in
            self?.content.viewEmpty.isHidden = property.emptyHidden
            self?.content.viewSelector.isHidden = property.selectorHidden
            self?.content.viewList.isHidden = property.listHidden
        }
        self.viewModel.update(property:viewModel)
    }
    
    private func configureListViewModel() {
        var viewModel:ViewModelList = self.viewModel.property()
        viewModel.observing = { [weak self] (property:ViewModelList) in
            self?.content.viewList.reloadData()
        }
        self.viewModel.update(property:viewModel)
    }
    
    private func configureSelectorViewModel() {
        var viewModel:ViewModelSelector = self.viewModel.property()
        viewModel.observing = { [weak self] (property:ViewModelSelector) in
            self?.content.viewSelector.layoutY.constant = property.positionY
            UIView.animate(withDuration:ViewConstants.Selector.animateDuration) { [weak self] in
                self?.content.layoutIfNeeded()
            }
        }
        self.viewModel.update(property:viewModel)
    }
    
    private func configureSelectedViewModel() {
        var viewModel:ViewModelSelected = self.viewModel.property()
        viewModel.observing = { [weak self] (property:ViewModelSelected) in
            self?.content.viewList.selectItem(at:property.indexPath, animated:true,
                                              scrollPosition:UICollectionViewScrollPosition.centeredVertically)
        }
        self.viewModel.update(property:viewModel)
    }
}
