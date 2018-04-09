import Foundation
@testable import catban

class MockLandingPresenterProtocol:LandingPresenterProtocol {
    var onUpdateViewModel:(() -> Void)?
    var onUpdateColumnAtIndex:((Int) -> Void)?
    var onUpdateCardAtIndex:((IndexPath) -> Void)?
    var onInsertCardAtIndex:((IndexPath) -> Void)?
    var onDeleteCardAtIndex:((IndexPath) -> Void)?
    var outlets:LandingPresenterOutletsProtocol
    var collection:LandingPresenterCollectionProtocol
    
    init() {
        self.outlets = LandingPresenterOutlets()
        self.collection = LandingPresenterCollection()
    }
    
    func update(viewModel:LandingViewModel) {
        self.onUpdateViewModel?()
    }
    
    func updateColumnAt(index:Int) {
        self.onUpdateColumnAtIndex?(index)
    }
    
    func updateCardAt(index:IndexPath) {
        self.onUpdateCardAtIndex?(index)
    }
    
    func insertCardAt(index:IndexPath) {
        self.onInsertCardAtIndex?(index)
    }
    
    func deleteCardAt(index:IndexPath) {
        self.onDeleteCardAtIndex?(index)
    }
}
