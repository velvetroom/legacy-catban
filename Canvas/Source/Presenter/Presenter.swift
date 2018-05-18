import Foundation
import Board

class Presenter:PresenterProtocol {
    weak var project:ProjectProtocol!
    var view:View
    var model:ModelProtocol
    
    init() {
        self.view = View()
        self.model = Model()
        self.assignReferences()
    }
    
    func refresh() {
        self.clear()
        self.load()
    }
    
    private func assignReferences() {
        self.view.drag = self.model
        self.model.mapDelegate = self.view
    }
    
    private func clear() {
        self.model.clear()
        self.view.clear()
    }
    
    private func load() {
        var first:Bool = true
        self.project.iterate { (column:ColumnProtocol) in
            var loader:PresenterColumnProtocol = PresenterFactory.makeColumnLoader()
            loader.view = self.view
            loader.mapEditor = self.model
            loader.column = column
            loader.first = first
            loader.load()
            first = false
        }
    }
}
