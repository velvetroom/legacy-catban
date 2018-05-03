import UIKit

class LandingPresenterOutlets:LandingPresenterOutletsProtocol {
    var list:LandingPresenterOutletsList
    
    init() {
        self.list = LandingPresenterOutletsList()
    }
    
    func update(viewModel:LandingViewModelOutlets) {
        self.list.controller?.title = viewModel.title
        self.list.layoutCollection?.viewModel = viewModel.collectionLayout
        self.collectionShould(reload:viewModel.reloadCollection)
        self.configureCollectionMenu(viewModel:viewModel.collectionMenu)
    }
    
    private func collectionShould(reload:Bool) {
        if reload {
            self.list.viewCollection?.reloadData()
        }
    }
    
    private func configureCollectionMenu(viewModel:LandingViewModelCollectionMenu) {
        self.updateMenuLayout(bottom:viewModel.layoutBottom)
        self.list.buttonCollectionMenuMoveRight?.isEnabled = viewModel.moveRightEnabled
        self.list.buttonCollectionMenuMoveLeft?.isEnabled = viewModel.moveLeftEnabled
    }
    
    private func updateMenuLayout(bottom:CGFloat) {
        self.list.layoutCollectionMenuBottom?.constant = bottom
        UIView.animate(withDuration:LandingViewModel.Constants.collectionMenuAnimationDuration) { [weak self] in
            self?.list.controller?.view.layoutIfNeeded()
        }
    }
}
