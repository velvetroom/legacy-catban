import Foundation

protocol ProjectEditorProtocol {
    var project:ProjectProtocol { get set }
    
    func moveCardFrom(origin:IndexPath, to destination:IndexPath)
}
