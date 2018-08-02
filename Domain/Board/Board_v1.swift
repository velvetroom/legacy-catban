import Foundation

class Board_v1:BoardProtocol, Codable {
    var name:String
    var created:Date
    var columns:[Column]
    
    init() {
        self.name = String()
        self.created = Date()
        self.columns = []
    }
}
