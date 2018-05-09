import Foundation
import Shared
import Board

public class Controller:ControllerCardProtocol {
    public var presenter:PresenterProtocol
    public var card:CardProtocol!
    public var project:ProjectManagedProtocol!
    public var transiton:TransitionProtocol!

    public required init() {
        
    }
}
