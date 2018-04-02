import Foundation

class LandingViewModelLoaderCollectionMenu {
    func factoryWith(model:LandingProtocol) -> LandingViewModelCollectionMenu {
        guard
            let project:ProjectProtocol = model.project,
            let editingCard:IndexPath = model.editingCard
        else {
            return LandingViewModelCollectionMenu()
        }
        let viewModel:LandingViewModelCollectionMenu
        if let editingCard:IndexPath = model.editingCard {
            
        } else {
            
        }
        return viewModel
    }
    
    private func factory
}
