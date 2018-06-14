import Foundation

public protocol ViewModelProtocol {
    var toolbarHidden:Bool { get set }
    var navigationbarHidden:Bool { get set }
    
    init()
}
