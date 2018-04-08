import Foundation

protocol LandingProtocol {
    var project:ProjectProtocol { get set }
    var viewModelLoader:LandingViewModelLoaderProtocol { get set }
    var presenter:LandingPresenterProtocol { get set }
    var editingCard:IndexPath? { get set }
    var editingCardReference:ProjectCard? { get }
    
    func reloadViewModel()
    func clearCardSelection()
    func cardAt(indexPath:IndexPath) -> ProjectCard
    func update(editingCard:IndexPath?)
    func moveCardFrom(origin:IndexPath, to destination:IndexPath)
    func deleteCardAt(indexPath:IndexPath)
    func moveEditingCardRight()
    func moveEditingCardLeft()
    func scrollToEditingCard()
    func updateCardAt(indexPath:IndexPath)
    func createCard() -> IndexPath
    func createColumn()
}
