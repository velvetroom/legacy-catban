import Foundation

class Project:ProjectProtocol {
    var columns:[ProjectColumn]
    var name:String
    
    init() {
        self.columns = []
        self.name = String()
    }
    
    func apply(updates:[CollectionUpdateProtocol]) {
        for update:CollectionUpdateProtocol in updates {
            update.strategy(project:self)
        }
    }
}
