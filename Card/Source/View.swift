import UIKit
import Shared

public class View:Shared.View<Interactor, Presenter, ViewContent>, UITextViewDelegate {
    public override func didLoad() {
        super.didLoad()
        self.configureView()
        self.configureViewModel()
    }
    
    private func configureView() {
        self.view.backgroundColor = UIColor.white
        let buttonDone:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.done,
                                                         target:self, action:#selector(self.selectorDone(button:)))
        let deleteIcon:UIImage = UIImage(name:ViewConstants.Navigation.iconDelete, in:type(of:self))
        let buttonDelete:UIBarButtonItem = UIBarButtonItem(image:deleteIcon,style:UIBarButtonItemStyle.plain,
                                                           target:self,
                                                           action:#selector(self.selectorDelete(button:)))
        self.navigationItem.rightBarButtonItems = [buttonDone, buttonDelete]
    }
    
    private func configureViewModel() {
        var viewModel:ViewModelContent = ViewModelContent()
        viewModel.observing = self.updated
        self.presenter.viewModel.update(property:viewModel)
    }
    
    private func updated(viewModel:ViewModelContent) {
        
    }
    
    @objc func selectorDone(button:UIBarButtonItem) {
//        self.presenter?.done()
    }
    
    @objc func selectorDelete(button:UIBarButtonItem) {
//        self.presenter?.delete()
    }
    
    public func textViewDidChange(_ textView:UITextView) {
//        self.presenter?.update(content:textView.text)
    }
}
