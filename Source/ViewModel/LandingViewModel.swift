import Foundation

struct LandingViewModel {
    var collection:LandingViewModelCollection
    var layout:LandingViewModelLayout
    var logoHidden:Bool
    
    init() {
        self.collection = LandingViewModelCollection()
        self.layout = LandingViewModelLayout()
        self.logoHidden = false
    }
}
