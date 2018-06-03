import Foundation
import Board

extension Presenter {
    var projectColumns:[MapColumnProtocol] {
        get {
            var index:Int = 0
            var columns:[MapNestableColumnProtocol] = []
            self.project.iterate { (column:ColumnProtocol) in
                columns.append(self.makeMapColumnWith(column:column, at:index))
                index += 1
            }
            return columns
        }
    }
    
    var newColumn:MapColumnProtocol {
        get {
            var loader:PresenterNewColumnProtocol = PresenterNewColumn()
            loader.view = self.view
            loader.load()
            return loader.mapColumn
        }
    }
    
    func load() {
        var columns:[MapColumnProtocol] = []
        columns.append(contentsOf:self.projectColumns)
        columns.append(self.newColumn)
        self.model.add(columns:columns)
    }
    
    private func makeMapColumnWith(column:ColumnProtocol, at index:Int) -> MapNestableColumnProtocol {
        var loader:PresenterColumnProtocol = PresenterColumn()
        loader.view = self.view
        loader.column = column
        loader.load()
        if index == 0 {
            loader.loadNewCard()
        }
        return loader.mapColumn
    }
}
