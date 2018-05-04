import Foundation
import Shared
import Load

class Injection {
    func load() {
        Configuration.navigationType = Navigation.self
        Configuration.controllerLoadType = Load.Controller.self
    }
}
