import Foundation

class OrganisePresenter:OrganisePresenterProtocol {
    var outlets:OrganisePresenterOutlets
    var collection:OrganisePresenterCollection
    
    init() {
        self.outlets = OrganisePresenterOutlets()
        self.collection = OrganisePresenterCollection()
    }
}
