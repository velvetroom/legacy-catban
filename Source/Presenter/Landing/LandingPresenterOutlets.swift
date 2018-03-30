import Foundation

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
    }
    
    private func collectionShould(reload:Bool) {
        if reload {
            self.list.viewCollection?.reloadData()
        }
    }
}
