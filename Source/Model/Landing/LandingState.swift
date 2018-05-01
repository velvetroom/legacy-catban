import Foundation

class LandingState {
    var delegate:LandingStateDelegateProtocol
    
    init() {
        self.delegate = LandingStateDelegateNull()
    }
}
