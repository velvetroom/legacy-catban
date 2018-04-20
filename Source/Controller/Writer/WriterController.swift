import UIKit

class WriterController:Controller, ControllerProtocol, UITextViewDelegate {
    var model:WriterProtocol
    
    override init() {
        self.model = Writer()
        super.init()
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
        self.finishWriting()
    }
    
    func finishWriting() {
        self.model.finishedWriting()
        self.presentingViewController?.dismiss(animated:true, completion:nil)
    }
}
