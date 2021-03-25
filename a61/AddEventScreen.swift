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
    
        let components = dateField.calendar.dateComponents([.day, .year, .month], from: dateField.date)
            let s = Event(date: "\(components.month!)/\(components.day!)/\(components.year!)", completed: false )
            s.showEvent();
//        self.navigationController?.popViewController(animated: true)
    }
}
