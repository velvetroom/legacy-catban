import Foundation
import CleanArchitecture
import Architecture
import Shared

public class View:Architecture.View<Presenter, ViewContent> {
    weak var titleProject:UIBarButtonItem!
    
    public override func didLoad() {
        super.didLoad()
        self.configureView()
        self.configureViewModel()
    }
    
    @objc func selectorDone(button:UIBarButtonItem) {
        self.presenter.done()
    }
    
    private func configureView() {
        let buttonDone:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.done,
                                                         target:self, action:#selector(self.selectorDone(button:)))
        let titleProject:UIBarButtonItem = UIBarButtonItem(title:nil, style:UIBarButtonItemStyle.plain,
                                                           target:nil, action:nil)
        titleProject.isEnabled = false
        self.titleProject = titleProject
        self.navigationItem.leftBarButtonItem = titleProject
        self.navigationItem.rightBarButtonItem = buttonDone
        self.title = String.localized(key:"View_Title", in:type(of:self))
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
        self.titleProject.title = viewModel.projectName
    }
}
