import Foundation

protocol LandingPresenterProtocol {
    var outlets:LandingPresenterOutletsProtocol { get set }
    var collection:LandingPresenterCollectionProtocol { get set }
    
    func update(viewModel:LandingViewModel)
    func updateColumnAt(index:Int)
    func updateCardAt(index:IndexPath)
    func insertCardAt(index:IndexPath)
    func deleteCardAt(index:IndexPath)
}
