import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initAppFunc();
    }

    @IBAction func addPersonButton(_ sender: Any) {
        let s2 = storyboard?.instantiateViewController(identifier: "screen2vc") as! Screen2ViewController;
        self.navigationController?.pushViewController(s2, animated: true)
    }
    
    @IBAction func addSupButton(_ sender: Any) {
        let s3 = storyboard?.instantiateViewController(identifier: "AddSupScreen") as! AddSupScreen;
        self.navigationController?.pushViewController(s3, animated: true)
    }
    
}

func initAppFunc() {
    let admin = Person(name: "Admin", email: "admin", password: "admin");
    let Person1 = Person(name: "N", email: "nnn", password: "admin");
    let doc1 = Supplier(name: "Ray", email: "ray", password: "admin", quantity: 6)
    let doc2 = Supplier(name: "Norman", email: "norman", password: "admin", quantity: 5)
    Person.currentPerson = admin;
    
    let e1 = Event(date: "2/22/2020", completed: false);
    let e2 = Event(date: "2/23/2020", completed: false);
    let e3 = Event(date: "2/24/2020", completed: false);
    let e4 = Event(date: "2/25/2020", completed: false);
    let e5 = Event(date: "2/26/2020", completed: false);
    let e6 = Event(date: "2/27/2020", completed: false);
    let e7 = Event(date: "3/1/2020", completed: false);
}
