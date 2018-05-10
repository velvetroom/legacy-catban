import Foundation
import Shared
import Board

public class Controller:ControllerProjectProtocol {
    public var presenter:PresenterProtocol
    public var project:ProjectManagedProtocol!
    public var transiton:TransitionProtocol!
    
    public required init() {
        let presenter:Presenter = Presenter()
        self.presenter = presenter
        self.presenter.delegate = self
        presenter.controller = self
    }
    
    func editCardWith(identifier:String) {
        self.transiton.transitionToCard(card:card, in:self.project)
    }
}
