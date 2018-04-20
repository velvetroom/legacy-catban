import Foundation

protocol ControllerProtocol {
    associatedtype Model
    var model:Model { get set }
}
