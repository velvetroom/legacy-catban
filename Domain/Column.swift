import Foundation

public struct Column:Codable {
    var identifier:String
    var name:String
    var created:Date
    var cards:[Card]
}
