import UIKit

open class View<Interactor, Presenter:PresenterProtocol, ViewModel, Content:UIView>:UIViewController,
PresentingViewProtocol where Interactor == Presenter.Interactor, ViewModel == Presenter.ViewModel {
    open weak var transition:TransitionProtocol!
    open var presenter:Presenter
    open var content:Content
    
    open var viewModel:ViewModel {
        didSet {
            self.viewModelUpdated()
        }
    }
    
    public var presentingViewModel:ViewModelProtocol {
        get {
            return self.viewModel
        }
        set(newValue) {
            self.viewModel = newValue as! ViewModel
        }
    }
    
    open var interactor:InteractorProtocol! {
        get {
            return self.presenter.interactor
        }
    }
    
    public required init() {
        self.content = Content()
        self.viewModel = ViewModel()
        self.presenter = PresenterFactory.makePresenter()
        super.init(nibName:nil, bundle:nil)
        self.presenter.presenting = self
        self.initProperties()
    }
    
    public init(presenter:Presenter) {
        self.content = Content()
        self.viewModel = ViewModel()
        self.presenter = presenter
        super.init(nibName:nil, bundle:nil)
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
    
    private func configureView() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
    }
}
