import Foundation

public protocol BoardProtocol {
    var identifier:String { get set }
    var created:Date { get set }
    var columns:[Column] { get set }
}
