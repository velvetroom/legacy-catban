import Foundation
import Shared
import Board

public class Controller:ControllerProjectProtocol, CanvasDelegateProtocol {
    public var presenter:PresenterProtocol
    public var project:ProjectManagedProtocol!
    public weak var transiton:TransitionProtocol!
    
    public required init() {
        let presenter:Presenter = Presenter()
        self.presenter = presenter
        self.presenter.delegate = self
        presenter.controller = self
    }
    
    public func editCardWith(identifier:String) {
        let card:CardProtocol = self.project.cardWith(identifier:identifier)
        self.transiton.transitionTo(card:card, in:self.project)
    }
    
    public func createNewCard() {
        let card:CardProtocol = CardFactory.newCard()
        self.project.add(card:card)
        self.transiton.transitionTo(card:card, in:self.project)
    }
}
