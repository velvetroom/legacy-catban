import Foundation

protocol ControllerProtocol {
    associatedtype Model:ModelProtocol
    var model:Model { get set }
}
