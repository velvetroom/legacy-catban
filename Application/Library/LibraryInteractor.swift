import Foundation
import CleanArchitecture

class LibraryInteractor:Interactor {
    weak var delegate:InteractorDelegate?
    
    required init() { }
}
