import Foundation

struct OrganisePresenterCollection {
    var delegate:OrganisePresenterCollectionDelegateProtocol
    var datasource:OrganisePresenterCollectionDatasourceProtocol
    
    init() {
        self.delegate = OrganisePresenterCollectionDelegate()
        self.datasource = OrganisePresenterCollectionDatasource()
    }
}
