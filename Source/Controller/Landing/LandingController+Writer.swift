import Foundation

extension LandingController {
    func openWriterForCardAt(indexPath:IndexPath) {
        let card:ProjectCard = self.model.cardAt(indexPath:indexPath)
        let controller:WriterController = WriterController()
        controller.model.text = card.title
        controller.model.onFinish = { [weak self] (title:String) in
            card.title = title
            
        }
        self.navigationController?.present(controller, animated:true, completion:nil)
    }
    
    func writerForCardFinished(title:String) {
        self.model.updateEditingCard(title:title)
    }
}
