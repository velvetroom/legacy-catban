import Foundation

class Board_v1:BoardProtocol, Codable {
    var identifier:String
    var name:String
    var created:Date
    var columns:[Column]
    
    init() {
        self.identifier = String()
        self.name = String()
        self.created = Date()
        self.columns = []
    }
}
