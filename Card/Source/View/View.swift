import UIKit
import Shared

class View:Shared.View, UITextViewDelegate {
    weak var presenter:Presenter!
    
    override func didLoad() {
        super.didLoad()
        self.configureNavigationItem()
    }
    
    private func configureNavigationItem() {
        let buttonDone:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.done,
                                                         target:self, action:#selector(self.selectorDone(button:)))
        let deleteIcon:UIImage = UIImage(name:ViewConstants.Navigation.iconTrash, in:type(of:self))
        let buttonDelete:UIBarButtonItem = UIBarButtonItem(image:deleteIcon,style:UIBarButtonItemStyle.plain,
                                                           target:self,
                                                           action:#selector(self.selectorDelete(button:)))
        self.navigationItem.rightBarButtonItems = [buttonDone, buttonDelete]
    }
    
    @objc func selectorDone(button:UIBarButtonItem) {
        self.presenter.done()
    }
    
    @objc func selectorDelete(button:UIBarButtonItem) {
        self.presenter.delete()
    }
    
    func textViewDidChange(_ textView:UITextView) {
        self.presenter.update(content:textView.text)
    }
}
