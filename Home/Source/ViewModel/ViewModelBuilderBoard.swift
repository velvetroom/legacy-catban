import UIKit
import Board

class ViewModelBuilderBoard:ViewModelBuilderProtocol {
    var project:ProjectManagedProtocol!
    var viewModel:ViewModel!
    
    required init() { }
    
    func build() -> ViewModel {
        self.viewModel.board.frame = CGRect(origin:CGPoint.zero, size:self.viewModel.scroll.contentSize)
        return self.viewModel
    }
}
