import Foundation
import Shared

public class Presenter:PresenterProtocol {
    public weak var view:ViewProtocol?
    public var interactor:Interactor!
    public var viewModel:ViewModel!
    
    public required init() { }
}
