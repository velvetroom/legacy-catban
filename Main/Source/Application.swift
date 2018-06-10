import UIKit
import Shared

@UIApplicationMain class Application:UIResponder, UIApplicationDelegate {
    var window:UIWindow?
    private let navigation:NavigationProtocol
    
    override init() {
        let injection:Injection = Injection()
        injection.load()
        self.navigation = Navigation()
        super.init()
    }
    
    func application(_:UIApplication, didFinishLaunchingWithOptions:[UIApplicationLaunchOptionsKey:Any]?) -> Bool {
        self.window = self.navigation.launch()
        return true
    }
}
