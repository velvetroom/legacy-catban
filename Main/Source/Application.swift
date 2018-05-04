import UIKit
import Shared

@UIApplicationMain class Application:UIResponder, UIApplicationDelegate {
    var navigation:NavigationProtocol
    var window:UIWindow?
    
    override init() {
        self.navigation = NavigationFactory.newNavigation()
        super.init()
    }
    
    func application(_:UIApplication, didFinishLaunchingWithOptions:[UIApplicationLaunchOptionsKey:Any]?) -> Bool {
        self.window = self.navigation.launch()
        return true
    }
}
