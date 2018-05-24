import UIKit

class ViewMenu:UIViewController {
    var presenter:PresenterMenu!
    weak var viewBase:ViewMenuBase!
    
    init() {
        super.init(nibName:nil, bundle:nil)
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func animateClose() {
        self.viewBase.animateClose()
    }
    
    @objc func selectorClose(button:UIButton) {
        self.presenter.close()
    }
    
    override func viewWillTransition(to size:CGSize, with coordinator:UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to:size, with:coordinator)
        self.view.frame = CGRect(origin:CGPoint.zero, size:size)
    }
    
    override func loadView() {
        self.view = self.configureViewBase()
    }
    
    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        self.viewBase.animateOpen()
    }
    
    private func configureViewBase() -> ViewMenuBase {
        let viewBase:ViewMenuBase = ViewMenuBase()
        viewBase.viewClose.addTarget(
            self, action:#selector(self.selectorClose(button:)), for:UIControlEvents.touchUpInside)
        self.viewBase = viewBase
        return viewBase
    }
}
