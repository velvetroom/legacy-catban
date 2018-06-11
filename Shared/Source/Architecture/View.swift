import UIKit

open class View<Interactor, Presenter:PresenterProtocol, Content:UIView>:
UIViewController, PresentingViewProtocol where Interactor == Presenter.Interactor {
    open weak var transition:TransitionProtocol!
    open var presenter:Presenter
    open var content:Content
    open var toolbarHidden:Bool
    open var navigationbarHidden:Bool
    public var interactor:InteractorProtocol! {
        get {
            return self.presenter.interactor
        }
    }
    
    public required init() {
        self.content = Content()
        self.toolbarHidden = true
        self.navigationbarHidden = false
        self.presenter = View.makePresenter()
        super.init(nibName:nil, bundle:nil)
        self.presenter.presenting = self
        self.initProperties()
    }
    
    public required init?(coder:NSCoder) {
        return nil
    }
    
    public init(presenter:Presenter) {
        self.content = Content()
        self.toolbarHidden = true
        self.navigationbarHidden = false
        self.presenter = presenter
        super.init(nibName:nil, bundle:nil)
        self.initProperties()
    }
    
    open override func loadView() {
        self.view = self.content
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.didLoad()
        self.presenter.didLoad()
        self.presenter.interactor.didLoad()
    }
    
    open override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        self.willAppear()
        self.presenter.willAppear()
    }
    
    open override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        self.didAppear()
        self.presenter.didAppear()
    }
    
    open override func viewWillTransition(to size:CGSize, with coordinator:UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to:size, with:coordinator)
        self.orientationChanged()
        self.presenter.orientationChanged()
    }
    
    open func initProperties() { }
    open func didLoad() { }
    open func willAppear() { }
    open func didAppear() { }
    open func orientationChanged() { }
    open func viewModelUpdated() { }
    
    private class func makePresenter() -> Presenter {
        var interactor:Interactor = Interactor()
        var presenter:Presenter = Presenter()
        presenter.interactor = interactor
        interactor.presenter = presenter
        return presenter
    }
    
    private func configureView() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
    }
}
