import UIKit

class WriterController<ModelType:WriterProtocol>:Controller<ModelType>, UITextViewDelegate {
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
    
    func finishWriting() {
        self.model.finishedWriting()
        self.presentingViewController?.dismiss(animated:true, completion:nil)
    }
    
    @objc func selectorDone(sender button:UIButton) {
        self.model.presenter.outlets.list.viewText?.resignFirstResponder()
        self.finishWriting()
    }
    
    @objc func notifiedKeyboardChanged(sender notification:Notification) {
        self.keyboardChanged(notification:notification)
    }
}
