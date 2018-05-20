import UIKit

protocol MapEditorProtocol:class {
    func add(columns:[MapColumnProtocol])
    func add(item:MapItemProtocol)
}
