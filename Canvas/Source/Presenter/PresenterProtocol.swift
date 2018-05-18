import Foundation
import Board

protocol PresenterProtocol {
    var view:View { get set }
    var project:ProjectProtocol! { get set }
    
    func refresh()
}
