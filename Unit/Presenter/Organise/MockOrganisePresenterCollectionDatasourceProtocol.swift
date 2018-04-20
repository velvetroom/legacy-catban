import Foundation
@testable import catban

class MockOrganisePresenterCollectionDatasourceProtocol:OrganisePresenterCollectionDatasourceProtocol {
    var viewModel:OrganiseViewModelCollection
    
    init() {
        self.viewModel = OrganiseViewModelCollection()
    }
}
