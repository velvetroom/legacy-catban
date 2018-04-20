import Foundation

class OrganisePresenter:OrganisePresenterProtocol {
    var outlets:OrganisePresenterOutlets
    
    init() {
        self.outlets = OrganisePresenterOutlets()
    }
}
