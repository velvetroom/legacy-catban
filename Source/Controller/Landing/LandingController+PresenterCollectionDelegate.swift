import Foundation

extension LandingController:LandingPresenterCollectionDelegateProtocol {
    func delegateSelectCellAt(index:IndexPath) {
        self.animateShowMenuForCellAt(index:index)
    }
    
    func delegateDeselectCell() {
        
    }
    
    private func animateShowMenuForCellAt(index:IndexPath) {
        guard
            let project:Project = self.project
        else {
            return
        }
        let viewModel:LandingViewModel = self.viewModelLoader.factoryWith(project:project, and:index)
        self.presenter.update(viewModel:viewModel)
    }
}
