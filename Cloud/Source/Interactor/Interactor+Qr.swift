import UIKit

extension Interactor {
    func generateQr(onCompletion:@escaping((UIImage) -> Void)) {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { [weak self] in
            self?.backgroundGenerateQr(onCompletion:onCompletion)
        }
    }
    
    private func backgroundGenerateQr(onCompletion:@escaping((UIImage) -> Void)) {
        
    }
}
