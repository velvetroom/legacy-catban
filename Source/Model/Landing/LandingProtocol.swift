import Foundation

protocol LandingProtocol {
    var project:ProjectProtocol { get set }
    var viewModelLoader:LandingViewModelLoaderProtocol { get set }
    var presenter:LandingPresenterProtocol { get set }
    var editingCard:IndexPath? { get set }
    var editingCardReference:ProjectCard? { get }
    
    func reloadViewModel()
    func clearCardSelection()
    func update(editingCard:IndexPath?)
    func moveCardFrom(origin:IndexPath, to destination:IndexPath)
    func moveEditingCardRight()
    func moveEditingCardLeft()
    func scrollToEditingCard()
    func updateEditingCard(title:String)
}
