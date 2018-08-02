import Foundation
import Firebase

class Services {
    class func start() {
        if FirebaseApp.app() == nil {
            FirebaseConfiguration.shared.setLoggerLevel(FirebaseLoggerLevel.min)
            FirebaseApp.configure()
            Firestore.firestore().settings.isPersistenceEnabled = false
        }
    }
    
    private init() { }
}
