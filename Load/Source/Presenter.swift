import Foundation
import Shared

public class Presenter:PresenterProtocol {
    public typealias ViewModel = Load.ViewModel
    public weak var presenting:PresentingViewProtocol?
    public var interactor:Interactor!
    
    public required init() { }
}
