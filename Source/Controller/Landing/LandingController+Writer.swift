import Foundation

extension LandingController {
    func openWriterFor(card:ProjectCard) {
        let controller:WriterController = WriterController()
        self.navigationController?.present(controller, animated:true, completion:nil)
    }
}
