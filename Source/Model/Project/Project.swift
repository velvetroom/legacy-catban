import Foundation

class Project {
    var columns:[ProjectColumn]
    var name:String
    
    init() {
        self.columns = []
        self.name = String()
    }
}
