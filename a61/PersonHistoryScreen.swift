import UIKit

class PersonHistoryScreen: UIViewController {
    
    @IBOutlet var textView : UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.orange
        
        textView.insertText("")
        textView.insertText(Person.currentPerson.getPersonString())
        textView.insertText("")
        textView.insertText("")
        textView.insertText("Prev Bookings:")
        textView.insertText("")
        textView.insertText("")
        // Do any additional setup after loading the view.
        let str: [String] = Person.currentPerson.bookingHistory.map{
            Event.EventList[($0)]?.getEventString() as! String;
        }
        textView.insertText(str.joined(separator: "\n") )
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
