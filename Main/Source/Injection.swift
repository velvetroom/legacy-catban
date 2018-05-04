import Foundation
import Shared

class Injection {
    func load() {
        Configuration.navigationType = Navigation.self
    }
}
