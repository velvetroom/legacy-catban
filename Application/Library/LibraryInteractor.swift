import Foundation
import CleanArchitecture
import Domain

class LibraryInteractor:Interactor {
    weak var delegate:InteractorDelegate?
    
    required init() { }
    
    func didLoad() {
        
    }
}
