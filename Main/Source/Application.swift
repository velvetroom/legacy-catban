import UIKit
import Shared

@UIApplicationMain class Application:UIResponder, UIApplicationDelegate {
    var window:UIWindow?
    
    override init() {
        let injection:Injection = Injection()
        injection.load()
        super.init()
    }
    
    func application(_:UIApplication, didFinishLaunchingWithOptions:[UIApplicationLaunchOptionsKey:Any]?) -> Bool {
        let navigation:NavigationProtocol = Navigation()
        self.window = navigation.launch()
        return true
    }
}
