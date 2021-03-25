import UIKit
class AddSupScreen: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var quantityField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        self.title = "Add Supplier"

        
        nameField.autocapitalizationType = .words;
        nameField.autocorrectionType = .no;
        passwordField.autocorrectionType = .no;
        emailField.autocorrectionType = .no;
        
    }
    
    @IBAction func addButtonHit(_ sender: Any){
        if(nameField.text != "" && passwordField.text != "" && emailField.text != "" && quantityField.text != ""){
       print("something")
            
            let s = Supplier(name: nameField.text!, email: emailField.text!, password: passwordField.text!, quantity: Int(quantityField.text!)!)
            s.showDetails();
        }
        else{
            print("error");
            let alert = UIAlertController(title: "Error", message: "Fields cant be empty", preferredStyle: .alert)

                   // add an action (button)
                   alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                   // show the alert
                   self.present(alert, animated: true, completion: nil)
        }
    }
}
