import Foundation
import CleanArchitecture
import Architecture

public class View:Architecture.View<Presenter, ViewContent> {
    public override func didLoad() {
        super.didLoad()
        self.configureView()
        self.configureViewModel()
    }
    
    @objc func selectorDone(button:UIBarButtonItem) {
//        self.presenter.done()
    }
    
    private func configureView() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.done,
                                                                 target:self,
                                                                 action:#selector(self.selectorDone(button:)))
    }
    
    private func configureViewModel() {
        self.configureContentViewModel()
    }
    
    private func configureContentViewModel() {
        var viewModel:ViewModelContent = self.viewModel.property()
        viewModel.observing = self.updated
        self.viewModel.update(property:viewModel)
    }
    
    private func updated(viewModel:ViewModelContent) {
        self.title = viewModel.title
    }
}
