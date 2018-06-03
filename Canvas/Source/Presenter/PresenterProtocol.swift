import Foundation
import Board

protocol PresenterProtocol {
    var canvas:CanvasEditorProtocol { get set }
    var view:View { get set }
    var project:ProjectProtocol! { get set }
    
    func refresh()
}
