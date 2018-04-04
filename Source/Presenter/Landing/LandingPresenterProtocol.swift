import Foundation

protocol LandingPresenterProtocol {
    var outlets:LandingPresenterOutletsProtocol { get set }
    var collection:LandingPresenterCollectionProtocol { get set }
    
    func update(viewModel:LandingViewModel)
    func updateCardAt(index:IndexPath)
}
