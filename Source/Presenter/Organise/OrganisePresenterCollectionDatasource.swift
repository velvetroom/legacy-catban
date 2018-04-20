import Foundation

class OrganisePresenterCollectionDatasource:OrganisePresenterCollectionDatasourceProtocol {
    var viewModel:OrganiseViewModelCollection
    
    init() {
        self.viewModel = OrganiseViewModelCollection()
    }
}
