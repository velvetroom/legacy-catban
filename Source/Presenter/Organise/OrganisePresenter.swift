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
}
