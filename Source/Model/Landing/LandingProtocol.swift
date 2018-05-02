import Foundation

protocol LandingProtocol:ModelProtocol, ProjectEditorProtocol {
    var board:BoardProtocol { get set }
    var presenter:LandingPresenterProtocol { get set }
    var editingCard:IndexPath? { get set }
    var editingCardReference:ProjectCard? { get }
    var state:LandingState { get set }
    
    func reloadViewModel()
    func clearCardSelection()
    func cardAt(indexPath:IndexPath) -> ProjectCard
    func columnAt(index:Int) -> ProjectColumn
    func indexFor(column:ProjectColumn) -> Int
    func deleteProject() throws
    func deleteCard()
    func deleteColumnAndMoveCardsAt(index:Int) throws
    func scrollToEditingCard()
    func scrollToTopRightCorner()
    func updateCard(title:String)
    func updateColumnAt(index:Int, with name:String)
    func updateProject(name:String)
    func createCard()
    func createColumn()
    func createProject()
    func stateStandby()
    func stateCardSelected(indexPath:IndexPath)
}
