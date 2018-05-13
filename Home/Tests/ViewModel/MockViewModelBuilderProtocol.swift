import Foundation
import Board
@testable import Home

class MockViewModelBuilderProtocol:ViewModelBuilderProtocol {
    static var onBuild:((MockViewModelBuilderProtocol) -> ViewModel)!
    var project:ProjectManagedProtocol!
    var viewModel:ViewModel!
    
    required init() { }
    
    func build() -> ViewModel {
        return MockViewModelBuilderProtocol.onBuild(self)
    }
}
