import Foundation
import Board

class Presenter:PresenterProtocol {
    weak var project:ProjectProtocol!
    var view:View
    var model:ModelProtocol
    private var columnIndex:Int
    
    var canvas:CanvasEditorProtocol {
        get {
            return self.model.canvas
        }
        set(newCanvas) {
            self.model.canvas = newCanvas
        }
    }
    
    init() {
        self.columnIndex = 0
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
        self.columnIndex = 0
        self.model.clear()
        self.view.clear()
    }
    
    private func load() {
        var columns:[MapColumn] = []
        self.project.iterate { (column:ColumnProtocol) in
            columns.append(self.makeMapColumnWith(column:column))
            self.columnIndex += 1
        }
        self.model.add(columns:columns)
    }
    
    private func makeMapColumnWith(column:ColumnProtocol) -> MapColumn {
        var loader:PresenterColumnProtocol = PresenterFactory.makeColumnLoader()
        loader.view = self.view
        loader.column = column
        loader.load()
        if self.columnIndex == 0 {
            loader.loadNewCard()
        }
        return loader.mapColumn
    }
}
