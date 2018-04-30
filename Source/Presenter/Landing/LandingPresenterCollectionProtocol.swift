import Foundation

protocol LandingPresenterCollectionProtocol {
    var delegate:LandingPresenterCollectionDelegate { get set }
    var dataSource:LandingPresenterCollectionDataSource { get set }
    var gesture:LandingPresenterCollectionGesture { get set }
    
    func update(viewModel:LandingViewModelCollection)
}
