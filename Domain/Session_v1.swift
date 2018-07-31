import Foundation

struct Session_v1:SessionProtocol, Codable {
    var boards:[String]
    var current:String?
    
    init() {
        self.boards = []
    }
}
