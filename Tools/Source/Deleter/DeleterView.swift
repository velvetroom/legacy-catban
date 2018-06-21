import UIKit
import Shared

class DeleterView<Interactor:DeleterInteractorProtocol>:View
    <Interactor, DeleterPresenter<Interactor>, DeleterViewContent> {
    override func initProperties() {
        super.initProperties()
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
    }
    
    override func didLoad() {
        super.didLoad()
        self.configureViewModel()
    }
    
    private func configureViewModel() {
        var viewModel:DeleterViewModel = self.viewModel.property()
        viewModel.observing = self.updated
        self.viewModel.update(property:viewModel)
    }
    
    private func updated(viewModel:DeleterViewModel) {
        
    }
}
