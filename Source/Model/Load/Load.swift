import Foundation

class Load:LoadProtocol {
    func loadBoard(completion:@escaping((Board) -> Void)) {
        
    }
    
    func backgroundLoadBoard(completion:@escaping((Board) -> Void)) {
        let a = DispatchQueue.global(qos:DispatchQoS.QoSClass.background)
        a.
    }
}
