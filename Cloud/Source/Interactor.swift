import Foundation
import CleanArchitecture
import Architecture
import Board

public class Interactor:InteractorProjectProtocol {
    public weak var presenter:InteractorDelegateProtocol?
    public weak var project:ProjectProtocol!
    public var board:BoardProtocol!
    
    public required init() { }
}
