import UIKit

@UIApplicationMain class Application:UIResponder, UIApplicationDelegate {
    var navigation:NavigationProtocol
    var window:UIWindow?
    
    override init() {
        self.navigation = Navigation()
        super.init()
    }
    
    func application(_:UIApplication, didFinishLaunchingWithOptions:[UIApplicationLaunchOptionsKey:Any]?) -> Bool {
        self.window = self.navigation.launch()
        return true
    }
}
