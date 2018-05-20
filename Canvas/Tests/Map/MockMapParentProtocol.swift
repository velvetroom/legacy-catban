import Foundation
@testable import Canvas

class MockMapParentProtocol:MapParentProtocol {
    var childItem:MapItemProtocol?
    var view:ViewNode!
}
