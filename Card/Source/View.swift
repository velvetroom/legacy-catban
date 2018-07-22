import UIKit
import Architecture
import Shared

public class View:Architecture.View<Presenter, ViewContent>, UITextViewDelegate {
    public override func didLoad() {
        super.didLoad()
        self.configureView()
        self.hookDelegates()
        self.configureViewModel()
    }
    
    public override func didAppear() {
        super.didAppear()
        self.content.viewText.becomeFirstResponder()
    }
    
    public func textViewDidChange(_ textView:UITextView) {
        self.presenter.update(content:textView.text)
    }
    
    @objc func selectorDone() {
        self.content.viewText.resignFirstResponder()
        self.presenter.done()
    }
    
    @objc func selectorDelete() {
        self.content.viewText.resignFirstResponder()
        self.presenter.delete()
    }
    
    private func configureView() {
        let buttonDone:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.done,
                                                         target:self, action:#selector(self.selectorDone))
        let deleteIcon:UIImage = UIImage(name:ViewConstants.Navigation.iconDelete, in:type(of:self))
        let buttonDelete:UIBarButtonItem = UIBarButtonItem(image:deleteIcon,style:UIBarButtonItemStyle.plain,
                                                           target:self,
                                                           action:#selector(self.selectorDelete))
        self.navigationItem.rightBarButtonItems = [buttonDone, buttonDelete]
    }
    
    private func hookDelegates() {
        self.content.viewText.delegate = self
        self.presenter.keyboardAdjuster.view = self.content.viewText
    }
    
    private func configureViewModel() {
        var viewModel:ViewModelContent = self.viewModel.property()
        viewModel.observing = { [weak self] (property:ViewModelContent) in
            self?.title = property.title
            self?.content.viewText.text = property.text
        }
        self.viewModel.update(property:viewModel)
    }
}
