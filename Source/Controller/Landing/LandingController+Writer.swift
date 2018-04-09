import Foundation

extension LandingController {
    func openWriterForCardAt(indexPath:IndexPath) {
        let card:ProjectCard = self.model.cardAt(indexPath:indexPath)
        let controller:WriterController = WriterController()
        controller.model.text = card.title
        controller.model.onFinish = { [weak self] (title:String) in
            card.title = title
            self?.model.updateCardAt(indexPath:indexPath)
        }
        self.navigationController?.present(controller, animated:true, completion:nil)
    }
    
    func openWriterForColumnAt(index:Int) {
        let column:ProjectColumn = self.model.columnAt(index:index)
        let controller:WriterController = WriterController()
        self.navigationController?.present(controller, animated:true, completion:nil)
    }
}
