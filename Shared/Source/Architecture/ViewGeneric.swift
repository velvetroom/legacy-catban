import Foundation

open class ViewGeneric<PresenterType:ViewDelegateProtocol>:View {
    var delegate:PresenterType
    
    public required init() {
        self.delegate = PresenterType.init()
        super.init()
    }
    
    public required init?(coder:NSCoder) {
        return nil
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate.didLoad(view:self)
    }
    
    open override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        self.delegate.didAppear(view:self)
    }
}
