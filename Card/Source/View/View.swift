import UIKit
import Shared

class View:Shared.View {
    private var buttonDone:UIBarButtonItem {
        get {
            return UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.done,
                                   target:nil, action:nil)
        }
    }
    
    private var buttonDelete:UIBarButtonItem {
        get {
            let deleteIcon:UIImage = UIImage(name:ViewConstants.View.iconTrash, in:type(of:self))
            return UIBarButtonItem(image:deleteIcon, style:UIBarButtonItemStyle.plain,
                                    target:nil, action:nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationItem()
    }
    
    private func configureNavigationItem() {
        self.navigationItem.rightBarButtonItems = [self.buttonDone, self.buttonDelete]
    }
}
