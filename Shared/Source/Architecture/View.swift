import UIKit

open class View<Delegate:PresenterViewProtocol, Content:UIView>:UIViewController, ViewProtocol {
    open weak var transition:TransitionProtocol!
    open var delegate:Delegate
    open var content:Content
    open var toolbarHidden:Bool
    open var navigationbarHidden:Bool
    
    public required init() {
        self.delegate = Delegate.init()
        self.content = Content.init()
        self.toolbarHidden = true
        self.navigationbarHidden = true
        super.init(nibName:nil, bundle:nil)
        self.delegate.view = self
        self.initProperties()
    }
    
    public required init?(coder:NSCoder) {
        return nil
    }
    
    open override func loadView() {
        self.view = self.content
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.didLoad()
        self.delegate.didLoad()
    }
    
    open override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        self.delegate.didAppear()
    }
    
    open override func viewWillTransition(to size:CGSize, with coordinator:UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to:size, with:coordinator)
        self.delegate.orientationChanged()
    }
    
    open func initProperties() { }
    open func didLoad() { }
    open func viewModelUpdated() { }
    
    private func configureView() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
    }
}
