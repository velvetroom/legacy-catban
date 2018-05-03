import Foundation

extension LandingController {
    func alertError(error:Error) {
        let controller:ErrorController = ErrorController()
        controller.model.message = error.localizedDescription
        self.navigationController?.present(controller, animated:true, completion:nil)
    }
}
