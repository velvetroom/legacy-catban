import UIKit

open class View:UIViewController, ViewProtocol {
    open weak var delegate:ViewDelegateProtocol?
    
    public required init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    public required init?(coder:NSCoder) {
        return nil
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.delegate?.didLoad(view:self.view)
    }
    
    private func configureView() {
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.always
    }
}
