import UIKit

class LandingPresenterOutlets:LandingPresenterOutletsProtocol {
    var list:LandingPresenterOutletsList
    
    init() {
        self.list = LandingPresenterOutletsList()
    }
    
    func update(viewModel:LandingViewModelOutlets) {
        self.list.controller?.title = viewModel.title
        self.list.imageLogo?.isHidden = viewModel.logoHidden
        self.list.layoutCollection?.viewModel = viewModel.collectionLayout
        self.collectionShould(reload:viewModel.reloadCollection)
        self.animateMenu(bottom:viewModel.collectionMenuBottom)
    }
    
    private func collectionShould(reload:Bool) {
        if reload {
            self.list.viewCollection?.reloadData()
        }
    }
    
    private func animateMenu(bottom:CGFloat) {
        self.list.layoutCollectionMenuBottom?.constant = bottom
        UIView.animate(withDuration:LandingController.Constants.collectionMenuAnimationDuration) { [weak self] in
            self?.list.controller?.view.layoutIfNeeded()
        }
    }
}
