import Foundation
import Shared

public protocol NamerInteractorProtocol:InteractorProtocol {
    func namerFinishedWith(name:String)
    func namerCancelled()
}
