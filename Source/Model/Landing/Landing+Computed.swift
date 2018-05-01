import Foundation

extension Landing {
    var project:ProjectProtocol {
        get {
            return self.board.project
        }
        set(newValue) {
            self.board.project = newValue
        }
    }
    
    var editingCardReference:ProjectCard? {
        get {
            guard
                let editingCard:IndexPath = self.editingCard
                else { return nil }
            return self.project.cardAt(indexPath:editingCard)
        }
    }
    
    var collection:LandingViewCollection? {
        get {
            return self.presenter.outlets.list.viewCollection
        }
    }
}
