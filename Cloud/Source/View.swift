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
        self.hookSelectors()
    }
    
    @objc func selectorDone(button:UIBarButtonItem) {
        self.presenter.done()
    }
    
    @objc func selectorStart(button:UIButton) {
        self.content.buttonStart.isEnabled = false
        self.presenter.start()
    }
    
    @objc func selectorContinue(button:UIButton) {
        self.presenter.updateViewModel()
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
        self.configureProjectViewModel()
        self.configureContentViewModel()
    }
    
    private func hookSelectors() {
        self.content.buttonStart.addTarget(self, action:#selector(self.selectorStart(button:)),
                                      for:UIControlEvents.touchUpInside)
    }
    
    private func configureProjectViewModel() {
        var viewModel:ViewModelProject = self.viewModel.property()
        viewModel.observing = self.updated
        self.viewModel.update(property:viewModel)
    }
    
    private func configureContentViewModel() {
        var viewModel:ViewModelContent = self.viewModel.property()
        viewModel.observing = self.updated
        self.viewModel.update(property:viewModel)
    }
    
    private func updated(viewModel:ViewModelProject) {
        self.titleProject.title = viewModel.projectName
    }
    
    private func updated(viewModel:ViewModelContent) {
        self.content.buttonStart.isEnabled = true
        self.content.icon.image = viewModel.icon
        self.content.buttonStart.isHidden = viewModel.buttonStartHidden
        self.content.label.text = viewModel.message
    }
}
