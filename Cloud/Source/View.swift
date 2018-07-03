import Foundation
import CleanArchitecture
import Architecture
import Shared

public class View:Architecture.View<Presenter, ViewContent> {
    weak var titleProject:UIBarButtonItem!
    
    public override func didLoad() {
        super.didLoad()
        self.configureView()
        self.configureActions()
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
    
    @objc func selectorSave(button:UIBarButtonItem) {
        self.presenter.save()
    }
    
    @objc func selectorShare(button:UIBarButtonItem) {
        self.presenter.share()
    }
    
    private func configureView() {
        let titleProject:UIBarButtonItem = UIBarButtonItem(title:nil, style:UIBarButtonItemStyle.plain, target:nil,
                                                           action:nil)
        titleProject.isEnabled = false
        self.titleProject = titleProject
        self.navigationItem.leftBarButtonItem = titleProject
        self.title = String.localized(key:"View_Title", in:type(of:self))
    }
    
    private func configureActions() {
        let buttonDone:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.done,
                                                         target:self, action:#selector(self.selectorDone(button:)))
        self.setToolbarItems(self.makeToolbarItems(), animated:false)
        self.navigationItem.rightBarButtonItem = buttonDone
    }
    
    private func configureViewModel() {
        self.configureProjectViewModel()
        self.configureContentViewModel()
    }
    
    private func hookSelectors() {
        self.content.buttonStart.addTarget(self, action:#selector(self.selectorStart(button:)),
                                      for:UIControlEvents.touchUpInside)
        self.content.buttonContinue.addTarget(self, action:#selector(self.selectorContinue(button:)),
                                              for:UIControlEvents.touchUpInside)
    }
    
    private func configureProjectViewModel() {
        var viewModel:ViewModelProject = self.viewModel.property()
        viewModel.observing = { [weak self] (property:ViewModelProject) in
            self?.titleProject.title = property.projectName
        }
        self.viewModel.update(property:viewModel)
    }
    
    private func configureContentViewModel() {
        var viewModel:ViewModelContent = self.viewModel.property()
        viewModel.observing = { [weak self] (property:ViewModelContent) in
            self?.content.buttonStart.isEnabled = true
            self?.content.icon.image = property.icon
            self?.content.buttonContinue.isHidden = property.buttonContinueHidden
            self?.content.buttonStart.isHidden = property.buttonStartHidden
            self?.content.label.text = property.message
        }
        self.viewModel.update(property:viewModel)
    }
}
