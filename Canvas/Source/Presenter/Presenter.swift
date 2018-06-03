import Foundation
import Board

class Presenter:PresenterProtocol {
    weak var project:ProjectProtocol!
    var view:View
    var model:ModelProtocol
    
    var canvas:CanvasEditorProtocol {
        get {
            return self.model.canvas
        }
        set(newCanvas) {
            self.model.canvas = newCanvas
        }
    }
    
    init() {
        self.view = View()
        self.model = Model()
        self.assignReferences()
    }
    
    func refresh() {
        self.clear()
        self.load()
        self.updateReferences()
    }
    
    private func assignReferences() {
        self.view.drag = self.model
        self.model.mapDelegate = self.view
    }
    
    private func updateReferences() {
        self.model.projectOrder = self.project
    }
    
    private func clear() {
        self.model.clear()
        self.view.clear()
    }
}
