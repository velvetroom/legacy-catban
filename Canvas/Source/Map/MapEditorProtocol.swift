import UIKit

protocol MapEditorProtocol:class {
    func add(columns:[MapColumnProtocol])
    func order(item:MapItemProtocol)
}
