import Foundation
import CleanArchitecture

public protocol NamerInteractorProtocol:InteractorProtocol {
    func namerFinishedWith(name:String)
    func namerCancelled()
}
