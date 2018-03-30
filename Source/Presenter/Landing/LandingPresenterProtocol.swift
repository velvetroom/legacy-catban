import Foundation

protocol LandingPresenterProtocol {
    var outlets:LandingPresenterOutletsProtocol { get set }
    var collection:LandingPresenterCollectionProtocol { get set }
    var collectionMenu:LandingPresenterCollectionMenuProtocol { get set }
    
    func update(viewModel:LandingViewModel)
}
