import Foundation

struct LandingViewModel {
    var collection:LandingViewModelCollection
    var logoHidden:Bool
    
    init() {
        self.collection = LandingViewModelCollection()
        self.logoHidden = false
    }
}
