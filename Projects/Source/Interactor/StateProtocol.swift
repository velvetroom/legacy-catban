import Foundation

protocol StateProtocol {
    func openNamer(interactor:Interactor)
    func namerFinishedWith(name:String, interactor:Interactor)
    func openDeleter(interactor:Interactor)
    func deleterConfirmed(interactor:Interactor)
}
