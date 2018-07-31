import Foundation

public protocol SessionProtocol {
    var boards:[String] { get set }
    var current:String? { get set }
}
