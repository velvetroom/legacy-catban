import UIKit
import Board
import CoreImage

extension Interactor {
    var qrContent:String {
        get {
            let project:ProjectSynchedProtocol = self.project as! ProjectSynchedProtocol
            return "\(Constants.Qr.prefix).\(project.remoteIdentifier).\(Constants.Qr.suffix)"
        }
    }
    
    private var transformation:CGAffineTransform {
        get {
            return CGAffineTransform(scaleX:Constants.Qr.scale, y:Constants.Qr.scale)
        }
    }
    
    func backgroundGenerateQr(onCompletion:@escaping((UIImage) -> Void)) {
        guard
            let filter:CIFilter = CIFilter(name:Constants.Qr.filterName),
            let content:Data = self.qrContent.data(using:String.Encoding.utf8, allowLossyConversion:false)
        else { return }
        filter.setValue(Constants.Qr.correctionValue, forKey:Constants.Qr.correctionKey)
        filter.setValue(content, forKey:Constants.Qr.contentKey)
        if let image:CIImage = filter.outputImage?.transformed(by:self.transformation) {
            self.generated(image:image, onCompletion:onCompletion)
        }
    }
    
    private func generated(image:CIImage, onCompletion:@escaping((UIImage) -> Void)) {
        guard
            let cgImage:CGImage = CIContext().createCGImage(image, from:image.extent)
        else { return }
        let uiImage:UIImage = UIImage(cgImage:cgImage, scale:Constants.Qr.saveScale, orientation:UIImageOrientation.up)
        DispatchQueue.main.async {
            onCompletion(uiImage)
        }
    }
    
    
    
    /*
 
     
     NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
     
     CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
     [filter setValue:@"H" forKey:@"inputCorrectionLevel"];
     [filter setValue:data forKey:@"inputMessage"];
     CIImage *ciimage = filter.outputImage;
     CIImage *scaleimage = [ciimage imageByApplyingTransform:CGAffineTransformMakeScale(10, 10)];
     CIContext *context = [CIContext contextWithOptions:nil];
     CGImageRef cgimage = [context createCGImage:scaleimage fromRect:scaleimage.extent];
     UIImage *uiimage = [UIImage imageWithCGImage:cgimage scale:1 orientation:UIImageOrientationUp];
     CFRelease(cgimage);
     
     return uiimage;
 */
}
