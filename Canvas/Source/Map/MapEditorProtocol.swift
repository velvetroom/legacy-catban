import UIKit

protocol MapEditorProtocol:class {
    func add(columns:[MapColumn])
    func add(item:MapItemProtocol)
}
