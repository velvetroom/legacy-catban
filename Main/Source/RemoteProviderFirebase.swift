import Foundation
import Shared
import FirebaseStorage

class RemoteProviderFirebase:RemoteProviderProtocol {
    private let reference:StorageReference
    
    required init() {
        self.reference = FirebaseStorage.Storage.storage().reference()
    }
    
    func save(data:Data, identifier:String, onCompletion:@escaping(() -> ()), onError:@escaping((Error) -> Void)) {
        self.reference.child(identifier).putData(data, metadata:nil) { (metadata:StorageMetadata?, error:Error?) in
            if let error:Error = error {
                onError(error)
            } else {
                onCompletion()
            }
        }
    }
    
    func load(identifier:String, onCompletion:@escaping((Data?) -> ()), onError:@escaping((Error) -> Void)) {
        self.reference.child(identifier).getData(
            maxSize:RemoteProviderConstants.maxFileSize) { (data:Data?, error:Error?) in
                if let error:Error = error {
                    onError(error)
                } else {
                    onCompletion(data)
                }
        }
    }
}
