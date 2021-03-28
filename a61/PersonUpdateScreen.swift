import UIKit

class PersonUpdateScreen: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var addressField: UITextField!
    @IBOutlet var phoneField: UITextField!

    
    @IBOutlet var addButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        self.title = "Add Person"
        
        nameField.autocapitalizationType = .words;
        nameField.autocorrectionType = .no;
        emailField.autocorrectionType = .no;
        let p = Person.currentPerson
        
        nameField.text = p?.name;
        emailField.text = p?.email;
        passwordField.text = p?.password;
        phoneField.text = p?.phone
        addressField.text = p?.address
    }
    
    @IBAction func addButtonHit(_ sender: Any){
        if(nameField.text != "" &&
            passwordField.text != "" &&
            Person.isValidEmail(emailField.text!) &&
            Person.isValidPhone(phoneField.text!) && addressField.text != ""){
            let p = Person.currentPerson
            p?.name = nameField.text!
            p?.email = emailField.text!
            p?.password = passwordField.text!
            p?.phone = phoneField.text!
            p?.address = addressField.text!;
        
            self.navigationController?.popViewController(animated: true)
        }
        else{
            print("error");
            let a5 = UIAlertController(title: "Error", message: "Invalid input", preferredStyle: .alert)

                   // add an action (button)
                   a5.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                   // show the alert
                   self.present(a5, animated: true, completion: nil)
        }
    }
}
