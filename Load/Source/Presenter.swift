import Foundation
import CleanArchitecture
import Architecture

public class Presenter:PresenterProtocol {
    public weak var view:ViewProtocol?
    public var transition:TransitionProtocol?
    public var interactor:Interactor!
    public var viewModel:ViewModel!
    
    public required init() { }
}
