import Foundation
import Board
@testable import Home

class MockViewModelBuilderProtocol:ViewModelBuilderProtocol {
    static var builder:ViewModelBuilderProtocol?
    var project:ProjectManagedProtocol!
    var viewModel:ViewModel!
    
    required init() { }
    
    func build() {
        MockViewModelBuilderProtocol.builder = self
    }
}
