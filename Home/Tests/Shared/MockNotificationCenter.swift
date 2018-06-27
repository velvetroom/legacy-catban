import Foundation

class MockNotificationCenter:NotificationCenter {
    var onRemoveObserver:(() -> Void)?
    
    override func removeObserver(_ observer:Any) {
        self.onRemoveObserver?()
    }
}
