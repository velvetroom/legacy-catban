import Foundation

class OrganisePresenterFactory:OrganisePresenterFactoryProtocol {
    func factoryWith(board:BoardProtocol) -> OrganiseViewModel {
        var viewModel:OrganiseViewModel = OrganiseViewModel()
        viewModel.collection = self.factoryCollectionWith(board:board)
        return viewModel
    }
    
    private func factoryCollectionWith(board:BoardProtocol) -> OrganiseViewModelCollection {
        var viewModel:OrganiseViewModelCollection = OrganiseViewModelCollection()
        for project:ProjectProtocol in board.projects {
            let item:OrganiseViewModelCollectionItem = self.factoryCollectionItemWith(project:project)
            viewModel.items.append(item)
        }
        return viewModel
    }
    
    private func factoryCollectionItemWith(project:ProjectProtocol) -> OrganiseViewModelCollectionItem {
        var viewModel:OrganiseViewModelCollectionItem = OrganiseViewModelCollectionItem()
        viewModel.name = project.name
        return viewModel
    }
}
