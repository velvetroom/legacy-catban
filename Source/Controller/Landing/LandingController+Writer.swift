import Foundation

extension LandingController {
    func openWriterFor(card:ProjectCard) {
        let controller:WriterController = WriterController()
        controller.model.text = card.title
        controller.model.onFinish = self.writerForCardFinished
        self.navigationController?.present(controller, animated:true, completion:nil)
    }
    
    func writerForCardFinished(title:String) {
        self.model.updateEditingCard(title:title)
    }
}
