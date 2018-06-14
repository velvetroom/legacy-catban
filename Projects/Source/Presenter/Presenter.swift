import Foundation
import Board
import Shared

public class Presenter:NSObject, PresenterProtocol {
    public typealias ViewModel = Projects.ViewModel
    public weak var presenting:PresentingViewProtocol?
    public var interactor:Interactor!
    var selected:IndexPath
    var trackingScroll:Bool
    
    public required override init() {
        self.selected = IndexPath(item:0, section:0)
        self.trackingScroll = true
        super.init()
    }
}
