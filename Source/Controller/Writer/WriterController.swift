import UIKit

class WriterController:UIViewController, UITextViewDelegate {
    var model:WriterProtocol
    
    init() {
        self.model = Writer()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.factoryOutlets()
        self.registerForNotifications()
    }
    
    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        self.model.presenter.outlets.list.viewText?.becomeFirstResponder()
    }
    
    func textViewDidChange(_ textView:UITextView) {
        self.model.text = textView.text
    }
    
    @objc func selectorDone(sender button:UIButton) {
        self.model.presenter.outlets.list.viewText?.resignFirstResponder()
    }
}
