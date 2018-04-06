import Foundation
@testable import catban

class MockLandingPresenter:LandingPresenterProtocol {
    var onUpdateViewModel:(() -> Void)?
    var onUpdateCardAtIndex:((IndexPath) -> Void)?
    var onInsertCardAtIndex:((IndexPath) -> Void)?
    var outlets:LandingPresenterOutletsProtocol
    var collection:LandingPresenterCollectionProtocol
    
    init() {
        self.outlets = LandingPresenterOutlets()
        self.collection = LandingPresenterCollection()
    }
    
    func update(viewModel:LandingViewModel) {
        self.onUpdateViewModel?()
    }
    
    func updateCardAt(index:IndexPath) {
        self.onUpdateCardAtIndex?(index)
    }
    
    func insertCardAt(index:IndexPath) {
        self.onInsertCardAtIndex?(index)
    }
}
