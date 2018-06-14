import UIKit
import Shared

class NavigationView:UINavigationController {
    private var animated:Bool {
        get {
            return self.viewControllers.count > 0
        }
    }
    
    init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func transitionTo(view:PresentingViewProtocol) {
        self.setViewControllers([view.viewController], animated:self.animated)
        self.setNavigationBarHidden(view.presentingViewModel.navigationbarHidden, animated:true)
        self.setToolbarHidden(view.presentingViewModel.toolbarHidden, animated:true)
    }
    
    func present(view:PresentingViewProtocol) {
        self.present(view.viewController, animated:false, completion:nil)
    }
    
    func pushTo(view:PresentingViewProtocol) {
        self.pushViewController(view.viewController, animated:true)
    }
    
    func pop() {
        self.popViewController(animated:true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationBar()
        self.configureToolbar()
    }
    
    private func configureNavigationBar() {
        self.navigationBar.backgroundColor = UIColor.white
        self.navigationBar.barTintColor = UIColor.white
        self.navigationBar.tintColor = UIColor.black
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.isTranslucent = false
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
    }
    
    private func configureToolbar() {
        self.toolbar.backgroundColor = UIColor.white
        self.toolbar.barTintColor = UIColor.white
        self.toolbar.tintColor = UIColor.black
        self.toolbar.isTranslucent = false
    }
}
