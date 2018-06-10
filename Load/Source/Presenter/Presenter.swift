import Foundation
import Shared

public class Presenter:PresenterProtocol {
    public weak var presenting:PresenterViewProtocol!
    public var interactor:Controller!
    
    public required init() { }
}
