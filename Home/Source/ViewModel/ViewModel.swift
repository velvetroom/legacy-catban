import UIKit

struct ViewModel {
    var view:ViewModelView
    var scroll:ViewModelScroll
    var board:ViewModelBoard
    var columns:[ViewModelColumn]
    var cards:[ViewModelCard]
    
    init() {
        self.view = ViewModelView()
        self.scroll = ViewModelScroll()
        self.board = ViewModelBoard()
        self.columns = []
        self.cards = []
    }
}
