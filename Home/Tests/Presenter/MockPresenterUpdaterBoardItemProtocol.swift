import Foundation
@testable import Home

class MockPresenterUpdaterBoardItemProtocol:PresenterUpdaterBoardItemProtocol {
    static var updater:MockPresenterUpdaterBoardItemProtocol?
    var controller:Controller!
    var viewBoard:ViewBoard!
    var viewModel:ViewModelBoardItemProtocol!
    var drag:Map!
    
    required init() { }
    
    func factoryView() {
        MockPresenterUpdaterBoardItemProtocol.updater = self
    }
}
