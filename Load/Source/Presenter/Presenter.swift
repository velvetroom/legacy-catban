import Foundation
import Shared

public class Presenter:PresenterProtocol {
    public var interactor:Controller!
    public weak var presenting:PresenterViewProtocol!
    
    public required init() { }
}
