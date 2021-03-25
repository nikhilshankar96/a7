import UIKit

class SupplierListView: UIViewController {
    
    @IBOutlet var textView : UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.orange

        // Do any additional setup after loading the view.
        let str: [String] = Supplier.SupplierList.values.map{
            $0.getSupplierString();
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
