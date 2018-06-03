import Foundation
@testable import Canvas
@testable import Board

class MockPresenterProtocol:PresenterProtocol {
    var onRefresh:(() -> Void)?
    var canvas:CanvasEditorProtocol
    var view:View
    var project:ProjectProtocol!
    
    init() {
        self.view = View()
        self.canvas = Canvas()
    }
    
    func refresh() {
        self.onRefresh?()
    }
}
