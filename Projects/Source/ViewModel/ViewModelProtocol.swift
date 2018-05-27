import UIKit

protocol ViewModelProtocol {
    var listHidden:Bool { get }
    var emptyHidden:Bool { get }
    var menuEnabled:Bool { get }
    var menuAlpha:CGFloat { get }
}
