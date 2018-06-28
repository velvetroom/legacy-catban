import Foundation
import CleanArchitecture
import Architecture

public class Presenter:PresenterProtocol {
    public weak var transition:TransitionProtocol?
    public weak var view:ViewProtocol?
    public var interactor:Interactor!
    public var viewModel:ViewModel!
    
    public required init() { }
}
