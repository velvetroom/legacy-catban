import Foundation

class OrganisePresenter:OrganisePresenterProtocol {
    var factory:OrganisePresenterFactoryProtocol
    var outlets:OrganisePresenterOutlets
    var collection:OrganisePresenterCollection
    
    init() {
        self.factory = OrganisePresenterFactory()
        self.outlets = OrganisePresenterOutlets()
        self.collection = OrganisePresenterCollection()
    }
    
    func updateWith(board:BoardProtocol) {
        let viewModel:OrganiseViewModel = self.factory.factoryWith(board:board)
        self.collection.datasource.viewModel = viewModel.collection
    }
}
