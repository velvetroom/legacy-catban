import UIKit
import Architecture
import Shared

public class View:Architecture.View<Presenter, ViewContent> {
    public override func didLoad() {
        super.didLoad()
        self.configureView()
        self.configureViewModel()
    }
    
    @objc func selectorDone(button:UIBarButtonItem) {
        self.presenter.done()
    }
    
    @objc func selectorRename(button:UIBarButtonItem) {
        self.presenter.rename()
    }
    
    @objc func selectorDelete(button:UIBarButtonItem) {
        self.presenter.delete()
    }
    
    private func configureView() {
        self.title = String.localized(key:"View_title", in:type(of:self))
        let imageRename:UIImage = UIImage(name:ViewConstants.Icons.rename, in:type(of:self))
        let imageDelete:UIImage = UIImage(name:ViewConstants.Icons.delete, in:type(of:self))
        let fixedSpace:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.fixedSpace,
                                                         target:nil, action:nil)
        let buttonDone:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.done, target:self,
                                                         action:#selector(self.selectorDone(button:)))
        let buttonRename:UIBarButtonItem = UIBarButtonItem(image:imageRename, style:UIBarButtonItemStyle.plain,
                                                           target:self, action:#selector(self.selectorRename(button:)))
        let buttonDelete:UIBarButtonItem = UIBarButtonItem(image:imageDelete, style:UIBarButtonItemStyle.plain,
                                                           target:self, action:#selector(self.selectorDelete(button:)))
        fixedSpace.width = ViewConstants.Navigation.fixedSpace
        self.navigationItem.rightBarButtonItems = [buttonDone, fixedSpace, buttonRename, buttonDelete]
    }
    
    private func configureViewModel() {
        var viewModel:ViewModelContent = self.viewModel.property()
        viewModel.observing = { [weak self] (property:ViewModelContent) in
            self?.content.labelName.text = property.name
        }
        self.viewModel.update(property:viewModel)
    }
}
