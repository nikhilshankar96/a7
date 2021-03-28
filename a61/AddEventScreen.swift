import UIKit
class AddEventScreen: UIViewController {
    
    @IBOutlet var dateField: UIDatePicker!
    
    @IBOutlet var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        self.title = "Add Event"

    }
    
    @IBAction func addButtonHit(_ sender: Any){
    
        let ts = dateField.date.timeIntervalSince1970
        let s = Event(date: ts, completed: false)
            s.showEvent();
        self.navigationController?.popViewController(animated: true)
    }
}
