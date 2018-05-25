import Foundation
import Shared
import Board

public class Controller:ControllerBoardProtocol {
    public var presenter:PresenterProtocol
    public var board:BoardProjectsProtocol!
    public weak var transiton:TransitionProtocol!
    
    public required init() {
        let presenter:Presenter = Presenter()
        self.presenter = presenter
        presenter.delegate = self
        presenter.controller = self
    }
}
