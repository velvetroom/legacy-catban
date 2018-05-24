import UIKit

class ViewMenu:UIViewController {
    private(set) weak var viewBase:ViewMenuBase!
    
    init() {
        super.init(nibName:nil, bundle:nil)
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func loadView() {
        self.view = self.configureViewBase()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animateOpen()
    }
    
    private func configureViewBase() -> ViewMenuBase {
        let viewBase:ViewMenuBase = ViewMenuBase()
        self.viewBase = viewBase
        return viewBase
    }
    
    private func animateOpen() {
        self.viewBase.viewClose.animateOpen()
        self.viewBase.viewBackground.animateOpen()
    }
    
    private func animateClose() {
        self.viewBase.viewClose.animateClose()
        self.viewBase.viewBackground.animateClose()
    }
}
