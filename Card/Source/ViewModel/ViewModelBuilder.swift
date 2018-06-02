import Foundation
import Board

class ViewModelBuilder {
    weak var card:CardProtocol!
    private var viewModel:ViewModel
    
    init() {
        self.viewModel = ViewModel()
    }
    
    func buildViewModel() -> ViewModel {
        self.buildView()
        self.buildText()
        return self.viewModel
    }
    
    private func buildView() {
        guard
            let containerName:String = self.card.container?.name
        else { return }
        self.viewModel.view.title = containerName
    }
    
    private func buildText() {
        self.viewModel.text.content = self.card.content
    }
}
