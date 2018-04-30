import Foundation

class LandingPresenterCollection:LandingPresenterCollectionProtocol {
    var delegate:LandingPresenterCollectionDelegate
    var dataSource:LandingPresenterCollectionDataSource
    var gesture:LandingPresenterCollectionGesture
    
    init() {
        self.delegate = LandingPresenterCollectionDelegate()
        self.dataSource = LandingPresenterCollectionDataSource()
        self.gesture = LandingPresenterCollectionGesture()
    }
    
    func update(viewModel:LandingViewModelCollection) {
        self.dataSource.viewModel = viewModel
    }
}
