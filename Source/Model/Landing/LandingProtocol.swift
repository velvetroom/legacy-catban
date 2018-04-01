import Foundation

protocol LandingProtocol {
    var project:ProjectProtocol? { get set }
    var editingCard:IndexPath? { get set }
    var projectLoader:ProjectLoaderProtocol { get set }
    var viewModelLoader:LandingViewModelLoaderProtocol { get set }
    var presenter:LandingPresenterProtocol { get set }
    
    func load()
    func reloadViewModel()
    func update(editingCard:IndexPath?)
    func reorderItemFrom(index:Int, to destination:Int, in section:Int)
    func moveEditinCardRight()
}
