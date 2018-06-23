import UIKit
import Shared

public class View:Shared.View<Interactor, Presenter, ViewContent>, UITextViewDelegate {
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
    
    @objc func selectorDone(button:UIBarButtonItem) {
        self.content.viewText.resignFirstResponder()
        self.presenter.done()
    }
    
    @objc func selectorDelete(button:UIBarButtonItem) {
        self.content.viewText.resignFirstResponder()
        self.presenter.delete()
    }
    
    private func configureView() {
        let buttonDone:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.done,
                                                         target:self, action:#selector(self.selectorDone(button:)))
        let deleteIcon:UIImage = UIImage(name:ViewConstants.Navigation.iconDelete, in:type(of:self))
        let buttonDelete:UIBarButtonItem = UIBarButtonItem(image:deleteIcon,style:UIBarButtonItemStyle.plain,
                                                           target:self,
                                                           action:#selector(self.selectorDelete(button:)))
        self.navigationItem.rightBarButtonItems = [buttonDone, buttonDelete]
    }
    
    private func hookDelegates() {
        self.content.viewText.delegate = self
        self.presenter.keyboardAdjuster.view = self.content.viewText
    }
    
    private func configureViewModel() {
        var viewModel:ViewModelContent = self.viewModel.property()
        viewModel.observing = self.updated
        self.viewModel.update(property:viewModel)
    }
    
    private func updated(viewModel:ViewModelContent) {
        self.title = viewModel.title
        self.content.viewText.text = viewModel.text
    }
}
