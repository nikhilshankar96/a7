import UIKit

class EventListView: UIViewController {
    
    @IBOutlet var textView : UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.orange
        
        // Do any additional setup after loading the view.
        let str: [String] = Event.EventList.values.map{
            $0.getEventString();
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
