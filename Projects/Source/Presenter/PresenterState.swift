import Foundation

struct PresenterState {
    var selected:String?
    var trackingScroll:Bool
    
    init() {
        self.trackingScroll = true
    }
}
