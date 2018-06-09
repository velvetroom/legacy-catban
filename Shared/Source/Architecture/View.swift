import UIKit

open class View<PresenterType:PresenterProtocol, ContentType:UIView>:UIViewController, ViewProtocol {
    open weak var transition:TransitionProtocol!
    open var presenter:PresenterType
    open var content:ContentType
    open var toolbarHidden:Bool
    open var navigationbarHidden:Bool
    
    public required init() {
        self.presenter = PresenterType.init()
        self.content = ContentType.init()
        self.toolbarHidden = true
        self.navigationbarHidden = true
        super.init(nibName:nil, bundle:nil)
        self.presenter.view = self
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
        self.presenter.didLoad()
    }
    
    open override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        self.presenter.didAppear()
    }
    
    open override func viewWillTransition(to size:CGSize, with coordinator:UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to:size, with:coordinator)
        self.presenter.orientationChanged()
    }
    
    open func initProperties() { }
    open func didLoad() { }
    open func viewModelUpdated() { }
    
    private func configureView() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
    }
}
