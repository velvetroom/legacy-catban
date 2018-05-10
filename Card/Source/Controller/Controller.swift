import Foundation
import Shared
import Board

public class Controller:ControllerCardProtocol {
    public var presenter:PresenterProtocol
    public var project:ProjectManagedProtocol!
    public weak var card:CardProtocol!
    public weak var transiton:TransitionProtocol!

    public required init() {
        let presenter:Presenter = Presenter()
        self.presenter = presenter
        self.presenter.delegate = self
        presenter.controller = self
    }
}
