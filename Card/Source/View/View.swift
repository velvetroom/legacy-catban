import UIKit
import Shared

class View:Shared.View, UITextViewDelegate {
    weak var presenter:Presenter?
    
    override func didLoad() {
        super.didLoad()
        self.configureView()
        self.configureNavigationItem()
    }
    
    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated:true)
    }
    
    private func configureView() {
        self.view.backgroundColor = UIColor.white
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
        self.presenter?.done()
    }
    
    @objc func selectorDelete(button:UIBarButtonItem) {
        self.presenter?.delete()
    }
    
    func textViewDidChange(_ textView:UITextView) {
        self.presenter?.update(content:textView.text)
    }
}
