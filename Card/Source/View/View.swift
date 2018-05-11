import UIKit
import Shared

class View:Shared.View, UITextViewDelegate {
    weak var controller:Controller!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationItem()
    }
    
    private func configureNavigationItem() {
        let buttonDone:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.done,
                                                         target:self,
                                                         action:#selector(self.selectorDone(sender:)))
        let deleteIcon:UIImage = UIImage(name:ViewConstants.View.iconTrash, in:type(of:self))
        let buttonDelete:UIBarButtonItem = UIBarButtonItem(image:deleteIcon,style:UIBarButtonItemStyle.plain,
                                                           target:self,
                                                           action:#selector(self.selectorDelete(sender:)))
        self.navigationItem.rightBarButtonItems = [buttonDone, buttonDelete]
    }
    
    @objc func selectorDone(sender button:UIBarButtonItem) {
        self.controller.done()
    }
    
    @objc func selectorDelete(sender button:UIBarButtonItem) {
        
    }
    
    func textViewDidChange(_ textView:UITextView) {
        self.controller.card.content = textView.text
    }
}
