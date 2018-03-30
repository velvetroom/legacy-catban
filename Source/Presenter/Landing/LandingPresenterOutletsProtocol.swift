import Foundation

protocol LandingPresenterOutletsProtocol {
    var list:LandingPresenterOutletsList { get set }
    
    func update(viewModel:LandingViewModelOutlets)
}
