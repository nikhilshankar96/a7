import UIKit

class LoginScreen: UIViewController {

    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAppFunc();
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonHit(_ sender: Any){
        //check if email exists
        if(emailField.text != "" && Person.IdEmailDict[emailField.text!] != nil){
            let id = Person.IdEmailDict[emailField.text!];
            //check if password matches
            if(passwordField.text! == Person.PersonList[String(id!)]?.password){
                Person.currentPerson = Person.PersonList[String(id!)];
                
                ///Set current Person
                Person.currentPerson = Person.PersonList[String(id!)];
                print("currentPerson: \(Person.currentPerson.name)")
                
                // Redirect to main screen here
                let s = storyboard?.instantiateViewController(identifier: "AppHome") as! ViewController;
                self.navigationController?.pushViewController(s, animated: true)
            } else{
                showAlert();
            }
            
        } else {
            showAlert();
        }
    }
 
    @IBAction func registerButtonHit(_ sender: Any){
        //ask if sup or per
        let a1 = UIAlertController(title: "Register", message: "Would you like to register as a User or Supplier?", preferredStyle: .alert)
        // add an action (button)
        a1.addAction(UIAlertAction(title: "User", style: UIAlertAction.Style.default, handler: redirectToP ))
        a1.addAction(UIAlertAction(title: "Supplier", style: UIAlertAction.Style.default, handler: redirectToS))

        // show the alert
        self.present(a1, animated: true, completion: nil)
        
    }
    
    func redirectToP(alert: UIAlertAction!) {
        let __ = storyboard?.instantiateViewController(identifier: "AddPersonScreen") as! Screen2ViewController;
        self.navigationController?.pushViewController(__, animated: true)
    }
    
    func redirectToS(alert: UIAlertAction!) {
        let __ = storyboard?.instantiateViewController(identifier: "AddSupScreen") as! AddSupScreen;
        self.navigationController?.pushViewController(__, animated: true)
    }
    
    func showAlert(){
        print("error");
        print(emailField.text!)
        let a2 = UIAlertController(title: "Error", message: "Invalid email or password combination", preferredStyle: .alert)
        // add an action (button)
        a2.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(a2, animated: true, completion: nil)
    }
    
    func initAppFunc() {
        let admin = Person(name: "Admin", email: "admin", password: "admin", phone: "6099685017", address: "21 Jump St");
        let Person1 = Person(name: "N", email: "nnn", password: "admin", phone: "6099685017", address: "21 Jump St");
        let doc1 = Supplier(name: "Ray", email: "ray", password: "admin", quantity: 6, phone: "6099685017", address: "21 Jump St")
        let doc2 = Supplier(name: "Norman", email: "norman", password: "admin", quantity: 5, phone: "6099685017", address: "21 Jump St")

        let e1 = Event(date: 1582358400, completed: false);
        let e2 = Event(date: 1582444800, completed: false);
        let e3 = Event(date: 1582531200, completed: false);
        let e4 = Event(date: 1582617600, completed: false);
        let e5 = Event(date: 1582704000, completed: false);
        let e6 = Event(date: 1582790400, completed: false);
        let e7 = Event(date: 1583049600, completed: false);
    }
}
