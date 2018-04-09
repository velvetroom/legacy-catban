import Foundation
@testable import catban

class MockLandingProtocol:LandingProtocol {
    var onReloadViewModel:(() -> Void)?
    var onMoveCardFrom:((IndexPath, IndexPath) -> Void)?
    var onDeleteCardAt:((IndexPath) -> Void)?
    var onMoveCardLeft:(() -> Void)?
    var onMoveCardRight:(() -> Void)?
    var onUpdateCardAt:((IndexPath) -> Void)?
    var onClearCardSelection:(() -> Void)?
    var onCreateCard:(() -> Void)?
    var onCreateColumn:(() -> Void)?
    var onColumnAtIndex:((Int) -> Void)?
    var project:ProjectProtocol
    var editingCard:IndexPath?
    var viewModelLoader:LandingViewModelLoaderProtocol
    var presenter:LandingPresenterProtocol
    var editingCardReference:ProjectCard?
    var returnCardAtIndex:ProjectCard
    var returnColumnAtIndex:ProjectColumn
    
    init() {
        self.project = Project()
        self.viewModelLoader = LandingViewModelLoader()
        self.presenter = LandingPresenter()
        self.returnCardAtIndex = ProjectCard()
        self.returnColumnAtIndex = ProjectColumn()
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
    
    func moveEditingCardRight() {
        self.onMoveCardRight?()
    }
    
    func moveEditingCardLeft() {
        self.onMoveCardLeft?()
    }
    
    func moveCardFrom(origin:IndexPath, to destination:IndexPath) {
        self.onMoveCardFrom?(origin, destination)
    }
    
    func deleteCardAt(indexPath:IndexPath) {
        self.onDeleteCardAt?(indexPath)
    }
    
    func scrollToEditingCard() {
        
    }
    
    func createCard() -> IndexPath {
        self.onCreateCard?()
        return IndexPath(item:0, section:0)
    }
    
    func createColumn() -> Int {
        self.onCreateColumn?()
        return 0
    }
    
    func columnAt(index:Int) -> ProjectColumn {
        self.onColumnAtIndex?(index)
        return self.returnColumnAtIndex
    }
}
