import Foundation

extension LandingController {
    func openWriterForCardAt(indexPath:IndexPath) {
        let card:ProjectCard = self.model.cardAt(indexPath:indexPath)
        let controller:WriterController<Writer> = WriterController<Writer>()
        controller.model.text = card.title
        controller.model.onFinish = { [weak self] (title:String) in
            card.title = title
            self?.model.updateCardAt(indexPath:indexPath)
        }
        self.navigationController?.present(controller, animated:true, completion:nil)
    }
    
    func openWriterForColumnAt(index:Int) {
        let column:ProjectColumn = self.model.columnAt(index:index)
        let controller:WriterController<Writer> = WriterController<Writer>()
        controller.model.text = column.name
        controller.model.onFinish = { [weak self] (name:String) in
            column.name = name
            self?.model.updateColumnAt(index:index)
        }
        self.navigationController?.present(controller, animated:true, completion:nil)
    }
    
    func openWriterForProject() {
        let project:ProjectProtocol = self.model.project
        let controller:WriterController<Writer> = WriterController<Writer>()
//        controller.model.text = project.name
        controller.model.onFinish = { [weak self] (name:String) in
//            project.name = name
//            self?.model.reloadViewModel()
        }
        self.navigationController?.present(controller, animated:true, completion:nil)
    }
}
