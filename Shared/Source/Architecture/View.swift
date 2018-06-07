import UIKit

open class View:UIViewController, ViewProtocol {
    open weak var delegate:ViewDelegateProtocol?
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
        self.delegate?.didLoad(view:self)
    }
    
    open override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setToolbarHidden(self.toolbarHidden, animated:true)
        self.navigationController?.setNavigationBarHidden(self.navigationbarHidden, animated:true)
        self.delegate?.didAppear(view:self)
    }
    
    open func didLoad() { }
    
    private func configureView() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
    }
}
