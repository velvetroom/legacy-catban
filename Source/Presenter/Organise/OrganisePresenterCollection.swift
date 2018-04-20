import Foundation

struct OrganisePresenterCollection {
    var delegate:OrganisePresenterCollectionDelegate
    
    init() {
        self.delegate = OrganisePresenterCollectionDelegate()
    }
}
