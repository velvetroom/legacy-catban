import Foundation
import Shared
import Firebase
import FirebaseStorage

class RemoteProviderFirebase:RemoteProviderProtocol {
    required init() {
        guard
            FirebaseApp.app() == nil
        else { return }
        FirebaseConfiguration.shared.setLoggerLevel(FirebaseLoggerLevel.min)
        FirebaseApp.configure()
    }
    
    func save(data:Data, identifier:String, onCompletion:@escaping(() -> ()), onError:@escaping((Error) -> Void)) {
        FirebaseStorage.Storage.storage().reference().child(identifier).putData(
        data, metadata:nil) { (metadata:StorageMetadata?, error:Error?) in
            if let error:Error = error {
                onError(error)
            } else {
                onCompletion()
            }
        }
    }
    
    func load(identifier:String, onCompletion:@escaping((Data?) -> ()), onError:@escaping((Error) -> Void)) {
        FirebaseStorage.Storage.storage().reference().child(identifier).getData(
        maxSize:RemoteProviderConstants.maxFileSize) { (data:Data?, error:Error?) in
            if let error:Error = error {
                onError(error)
            } else {
                onCompletion(data)
            }
        }
    }
}
