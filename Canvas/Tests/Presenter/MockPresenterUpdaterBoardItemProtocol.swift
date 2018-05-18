import Foundation
@testable import Home

class MockPresenterUpdaterBoardItemProtocol:PresenterUpdaterBoardItemProtocol {
    static var updater:MockPresenterUpdaterBoardItemProtocol?
    var viewBoard:ViewBoard!
    var viewModel:ViewModelBoardItemProtocol!
    var column:MapColumn!
    var returnViewItem:ViewBoardItem!
    var returnMapItem:MapItemProtocol!
    
    var viewItem:ViewBoardItem {
        get {
            return self.returnViewItem
        }
    }
    
    var mapItem:MapItemProtocol {
        get {
            return self.returnMapItem
        }
    }
    
    required init() { }
    
    func configureContent() {
        MockPresenterUpdaterBoardItemProtocol.updater = self
    }
}
