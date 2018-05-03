import UIKit

open class View:UIViewController, ViewProtocol {
    open var delegate:ViewDelegateProtocol?
    
    public init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    public required init?(coder:NSCoder) {
        return nil
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate?.viewDidLoad()
    }
}
