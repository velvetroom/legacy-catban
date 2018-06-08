import UIKit

open class View:UIViewController {
    open weak var transition:TransitionProtocol!
    open var toolbarHidden:Bool
    open var navigationbarHidden:Bool
    
    public required init() {
        self.toolbarHidden = true
        self.navigationbarHidden = true
        super.init(nibName:nil, bundle:nil)
    }
    
    public required init?(coder:NSCoder) {
        return nil
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.didLoad()
    }
    
    open func didLoad() { }
    
    private func configureView() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
    }
}
