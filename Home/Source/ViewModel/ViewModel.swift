import UIKit

struct ViewModel {
    var view:ViewModelView
    var scroll:ViewModelScroll
    var board:ViewModelBoard
    
    init() {
        self.view = ViewModelView()
        self.scroll = ViewModelScroll()
        self.board = ViewModelBoard()
    }
}
