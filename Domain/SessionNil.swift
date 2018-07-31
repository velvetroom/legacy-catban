import Foundation

struct SessionNil:SessionProtocol {
    var boards:[String]
    var current:String?
    
    init() {
        self.boards = []
    }
}
