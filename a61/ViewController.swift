import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addPersonButton(_ sender: Any) {
        let s2 = storyboard?.instantiateViewController(identifier: "AddPersonScreen") as! Screen2ViewController;
        self.navigationController?.pushViewController(s2, animated: true)
    }
    
    @IBAction func addSupButton(_ sender: Any) {
        let s3 = storyboard?.instantiateViewController(identifier: "AddSupScreen") as! AddSupScreen;
        self.navigationController?.pushViewController(s3, animated: true)
    }
   
    @IBAction func addEventButton(_ sender: Any) {
        let s4 = storyboard?.instantiateViewController(identifier: "AddEventScreen") as! AddEventScreen;
        self.navigationController?.pushViewController(s4, animated: true)
    }
    
    @IBAction func viewEventsButton(_ sender: Any) {
        let s = storyboard?.instantiateViewController(identifier: "EventListView") as! EventListView;
        self.navigationController?.pushViewController(s, animated: true)
    }
    
    @IBAction func viewSuppliersButton(_ sender: Any) {
        let s = storyboard?.instantiateViewController(identifier: "SupplierListView") as! SupplierListView;
        self.navigationController?.pushViewController(s, animated: true)
    }
    
    @IBAction func bookEventButton(_ sender: Any) {
        let s7 = storyboard?.instantiateViewController(identifier: "EventBookingScreen") as! EventBookingScreen;
        self.navigationController?.pushViewController(s7, animated: true)
    }
    
    @IBAction func accountButton(_ sender: Any) {
        let s12 = storyboard?.instantiateViewController(identifier: "PersonHistoryScreen") as! PersonHistoryScreen;
        self.navigationController?.pushViewController(s12, animated: true)
    }
    
    @IBAction func updateAccountButton(_ sender: Any) {
        if( Supplier.SupplierList[Person.currentPerson.uuid]   != nil){
            print("Supplier")
            let s = storyboard?.instantiateViewController(identifier: "UpdateSupplierScreen") as! UpdateSupplierScreen;
            self.navigationController?.pushViewController(s, animated: true)
        } else {
            print("Person")
            let p = storyboard?.instantiateViewController(identifier: "PersonUpdateScreen") as! PersonUpdateScreen;
            self.navigationController?.pushViewController(p, animated: true)
        }
    }
    
    @IBAction func statusButton(_ sender: Any) {
        //alert
        let a9 = UIAlertController(title: "Compliance Status", message: Person.currentPerson.isCompliant() ? "Yes" : "No" , preferredStyle: .alert)

        // add an action (button)
        a9.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(a9, animated: true, completion: nil)
    }
}


