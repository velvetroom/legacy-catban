import UIKit

class ViewMenu:UIViewController {
    init() {
        super.init(nibName:nil, bundle:nil)
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func loadView() {
        self.view = ViewMenuBase()
    }
}
