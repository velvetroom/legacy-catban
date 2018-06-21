import Foundation

class MockNotificationCenter:NotificationCenter {
    var onAddObserver:(() -> Void)?
    var onRemoveObserver:(() -> Void)?
    
    override func addObserver(forName name:NSNotification.Name?, object obj:Any?, queue:OperationQueue?,
                              using block:@escaping(Notification) -> Void) -> NSObjectProtocol {
        self.onAddObserver?()
        return NSObject()
    }
    
    override func removeObserver(_ observer:Any) {
        self.onRemoveObserver?()
    }
}
