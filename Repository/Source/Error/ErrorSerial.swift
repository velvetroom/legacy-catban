import Foundation
import Shared

struct ErrorSerial:LocalizedError {
    let errorDescription:String?
    
    static let corruptedData:ErrorSerial = ErrorSerial(errorDescription:
        String.localized(key:"ErrorSerial_corruptedData", in:Repository.self))
}
