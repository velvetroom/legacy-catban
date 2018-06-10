import UIKit

open class View<Interactor, Delegate:ViewDelegateProtocol, Content:UIView>:
    UIViewController, PresenterViewProtocol where Interactor == Delegate.Interactor {
    open weak var transition:TransitionProtocol!
    open var delegate:Delegate
    open var content:Content
    open var toolbarHidden:Bool
    open var navigationbarHidden:Bool
    
    public required init() {
        let interactor:Interactor = Interactor()
        self.delegate = Delegate()
        self.content = Content()
        self.toolbarHidden = true
        self.navigationbarHidden = true
        super.init(nibName:nil, bundle:nil)
        self.delegate.presenting = self
        self.initProperties()
        self.delegate.interactor = interactor
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
    
    open func initProperties() { }
    open func didLoad() { }
    open func viewModelUpdated() { }
    
    private func configureView() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
    }
}
