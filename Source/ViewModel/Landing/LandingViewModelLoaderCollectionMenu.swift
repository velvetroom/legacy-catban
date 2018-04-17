import Foundation

class LandingViewModelLoaderCollectionMenu {
    private var viewModelForEdition:LandingViewModelCollectionMenu {
        get {
            var viewModel:LandingViewModelCollectionMenu = LandingViewModelCollectionMenu()
            viewModel.layoutBottom = 0
            return viewModel
        }
    }
    
    func factoryWith(model:LandingProtocol) -> LandingViewModelCollectionMenu {
        guard
            let editingCard:IndexPath = model.editingCard
        else {
            return LandingViewModelCollectionMenu()
        }
        return self.factoryWith(project:model.board.project, editingCard:editingCard)
    }
    
    private func factoryWith(project:ProjectProtocol, editingCard:IndexPath) -> LandingViewModelCollectionMenu {
        let column:Int = editingCard.section
        var viewModel:LandingViewModelCollectionMenu = self.viewModelForEdition
        viewModel.moveRightEnabled = self.moveRightEnabledFor(column:column, on:project)
        viewModel.moveLeftEnabled = self.moveLeftEnabledFor(column:column)
        return viewModel
    }
    
    private func moveRightEnabledFor(column:Int, on project:ProjectProtocol) -> Bool {
        return column < project.columns.count - 1
    }
    
    private func moveLeftEnabledFor(column:Int) -> Bool {
        return column > 0
    }
}
