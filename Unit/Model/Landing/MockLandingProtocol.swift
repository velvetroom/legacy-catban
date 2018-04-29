import Foundation
@testable import catban

class MockLandingProtocol:LandingProtocol {
    var onReloadViewModel:(() -> Void)?
    var onMoveCardFrom:((IndexPath, IndexPath) -> Void)?
    var onDeleteEditingCard:(() -> Void)?
    var onDeleteColumnAt:((Int) -> Void)?
    var onMoveCardLeft:(() -> Void)?
    var onMoveCardRight:(() -> Void)?
    var onUpdateCardAt:((IndexPath) -> Void)?
    var onUpdateColumnAt:((Int) -> Void)?
    var onClearCardSelection:(() -> Void)?
    var onCreateCard:(() -> Void)?
    var onCreateColumn:(() -> Void)?
    var onCreateProject:(() -> Void)?
    var onColumnAtIndex:((Int) -> Void)?
    var onIndexForColumn:((ProjectColumn) -> Void)?
    var onScrollToEditingCard:(() -> Void)?
    var onScrollToTopRightCorner:(() -> Void)?
    var onDeleteProject:(() -> Void)?
    var onUpdateProjectName:((String) -> Void)?
    var editingCard:IndexPath?
    var presenter:LandingPresenterProtocol
    var editingCardReference:ProjectCard?
    var returnCardAtIndex:ProjectCard
    var returnColumnAtIndex:ProjectColumn
    var returnIndexForColumn:Int
    var throwingError:Error?
    var board:BoardProtocol
    var project:ProjectProtocol {
        get {
            return self.board.project
        }
        set(newValue) {
            self.board.project = newValue
        }
    }
    
    required init() {
        self.board = Board()
        self.presenter = LandingPresenter()
        self.returnCardAtIndex = ProjectCard()
        self.returnColumnAtIndex = ProjectColumn()
        self.returnIndexForColumn = 0
    }
    
    func load() {
        
    }
    
    func reloadViewModel() {
        self.onReloadViewModel?()
    }
    
    func clearCardSelection() {
        self.onClearCardSelection?()
    }
    
    func cardAt(indexPath:IndexPath) -> ProjectCard {
        return self.returnCardAtIndex
    }
    
    func update(editingCard:IndexPath?) {

    }
    
    func updateCardAt(indexPath:IndexPath) {
        self.onUpdateCardAt?(indexPath)
    }
    
    func updateColumnAt(index:Int) {
        self.onUpdateColumnAt?(index)
    }
    
    func moveEditingCardRight() {
        self.onMoveCardRight?()
    }
    
    func moveEditingCardLeft() {
        self.onMoveCardLeft?()
    }
    
    func moveCardFrom(origin:IndexPath, to destination:IndexPath) {
        self.onMoveCardFrom?(origin, destination)
    }
    
    func deleteEditingCard() {
        self.onDeleteEditingCard?()
    }
    
    func deleteColumnAndMoveCardsAt(index:Int) throws {
        if let throwingError:Error = self.throwingError {
            throw throwingError
        }
        self.onDeleteColumnAt?(index)
    }
    
    func scrollToEditingCard() {
        self.onScrollToEditingCard?()
    }
    
    func scrollToTopRightCorner() {
        self.onScrollToTopRightCorner?()
    }
    
    func createColumn() {
        self.onCreateColumn?()
    }
    
    func createProject() {
        self.onCreateProject?()
    }
    
    func columnAt(index:Int) -> ProjectColumn {
        self.onColumnAtIndex?(index)
        return self.returnColumnAtIndex
    }
    
    func indexFor(column:ProjectColumn) -> Int {
        self.onIndexForColumn?(column)
        return self.returnIndexForColumn
    }
    
    func deleteProject() throws {
        self.onDeleteProject?()
        if let throwingError:Error = self.throwingError {
            throw throwingError
        }
    }
    
    func updateProject(name:String) {
        self.onUpdateProjectName?(name)
    }
    
    func createCard() {
        self.onCreateCard?()
    }
}
