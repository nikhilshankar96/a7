import UIKit

class UpdateSupplierScreen: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var phoneField: UITextField!
    @IBOutlet var addressField: UITextField!
    @IBOutlet var quantityField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        self.title = "Add Supplier"

        
        nameField.autocapitalizationType = .words;
        nameField.autocorrectionType = .no;
        emailField.autocorrectionType = .no;
        
        let p = Person.currentPerson as! Supplier
        
        nameField.text = p.name;
        emailField.text = p.email;
        passwordField.text = p.password;
        phoneField.text = p.phone
        addressField.text = p.address
        quantityField.text = String(p.quantity)
    }
    
    @IBAction func addButtonHit(_ sender: Any){
        if(nameField.text != "" &&
            passwordField.text != "" &&
            Person.isValidEmail(emailField.text!) &&
            Person.isValidPhone(phoneField.text!) &&
            quantityField.text != "" &&
            Int(quantityField.text!) != nil){
         
            let p = Person.currentPerson as! Supplier
            
            p.name = nameField.text!
            p.email = emailField.text!
            p.password = passwordField.text!
            p.phone = phoneField.text!
            p.address = addressField.text!;
            p.quantity = Int(quantityField.text!)!
            
            self.navigationController?.popViewController(animated: true)
        }
        else{
            print("error");
            let a4 = UIAlertController(title: "Error", message: "Invalid input!", preferredStyle: .alert)

            // add an action (button)
            a4.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

            // show the alert
            self.present(a4, animated: true, completion: nil)
        }
    }
}
