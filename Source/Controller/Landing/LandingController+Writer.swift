import Foundation

extension LandingController {
    func openWriterForEditingCard() {
        guard
            let indexPath:IndexPath = self.model.editingCard
        else { return }
        let card:ProjectCard = self.model.cardAt(indexPath:indexPath)
        let controller:WriterController<Writer> = WriterController<Writer>()
        controller.model.text = card.title
        controller.model.onFinish = { [weak self] (title:String) in
            self?.model.updateCard(title:title)
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
        let controller:WriterController<Writer> = WriterController<Writer>()
        controller.model.text = self.model.project.name
        controller.model.onFinish = { [weak self] (name:String) in
            self?.model.updateProject(name:name)
        }
        self.navigationController?.present(controller, animated:true, completion:nil)
    }
}
