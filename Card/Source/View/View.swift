import UIKit
import Shared

class View:Shared.ViewCard, UITextViewDelegate {
    override func didLoad() {
        super.didLoad()
        self.configureView()
        self.configureNavigationItem()
    }
    
    private func configureView() {
        self.view.backgroundColor = UIColor.white
        self.delegate = Presenter()
    }
    
    private func configureNavigationItem() {
        let buttonDone:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.done,
                                                         target:self, action:#selector(self.selectorDone(button:)))
        let deleteIcon:UIImage = UIImage(name:ViewConstants.Navigation.iconDelete, in:type(of:self))
        let buttonDelete:UIBarButtonItem = UIBarButtonItem(image:deleteIcon,style:UIBarButtonItemStyle.plain,
                                                           target:self,
                                                           action:#selector(self.selectorDelete(button:)))
        self.navigationItem.rightBarButtonItems = [buttonDone, buttonDelete]
    }
    
    @objc func selectorDone(button:UIBarButtonItem) {
//        self.presenter?.done()
    }
    
    @objc func selectorDelete(button:UIBarButtonItem) {
//        self.presenter?.delete()
    }
    
    func textViewDidChange(_ textView:UITextView) {
//        self.presenter?.update(content:textView.text)
    }
}
