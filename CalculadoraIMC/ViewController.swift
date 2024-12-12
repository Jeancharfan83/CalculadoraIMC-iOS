import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgBody: UIImageView!
    @IBOutlet weak var icFemale: UIImageView!
    @IBOutlet weak var icMale: UIImageView!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultLabel2: UILabel!
    
    var height: Int = 140
    var weight: Double = 60.0
    var selectedGender: String?  // Para almacenar el género seleccionado
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Añadir reconocimiento de toques a los íconos
        let femaleTapGesture = UITapGestureRecognizer(target: self, action: #selector(femaleTapped))
        icFemale.isUserInteractionEnabled = true
        icFemale.addGestureRecognizer(femaleTapGesture)
        
        let maleTapGesture = UITapGestureRecognizer(target: self, action: #selector(maleTapped))
        icMale.isUserInteractionEnabled = true
        icMale.addGestureRecognizer(maleTapGesture)
    }
    
    // Acción cuando el ícono de "mujer" es tocado
    @objc func femaleTapped() {
        selectedGender = "female"
        
        // Cambiar el estilo visual para resaltar el ícono seleccionado
        icFemale.layer.borderWidth = 2
        icFemale.layer.borderColor = UIColor.white.cgColor
        icMale.layer.borderWidth = 0  // Quitar el borde del ícono de hombre
        
        // Actualizar el estilo visual
        icFemale.alpha = 1.0 // Restaurar opacidad al ícono de mujer
        icMale.alpha = 0.6   // Reducir opacidad al ícono de hombre
    }
    
    // Acción cuando el ícono de "hombre" es tocado
    @objc func maleTapped() {
        selectedGender = "male"
        
        // Cambiar el estilo visual para resaltar el ícono seleccionado
        icMale.layer.borderWidth = 2
        icMale.layer.borderColor = UIColor.white.cgColor
        icFemale.layer.borderWidth = 0  // Quitar el borde del ícono de mujer
        
        // Actualizar el estilo visual
        icMale.alpha = 1.0 // Restaurar opacidad al ícono de hombre
        icFemale.alpha = 0.6 // Reducir opacidad al ícono de mujer
    }
    
    @IBAction func SsetHeight(_ sender: UISlider) {
        height = Int(sender.value)
        heightLabel.text = "\(height) cm"
    }
    
    @IBAction func setWeight(_ sender: UIStepper) {
        weight = sender.value
        weightLabel.text = "\(weight) Kg"
    }
    
    @IBAction func calculate(_ sender: Any) {
        let heightInMeters = Double(height) / 100.0
        let result = weight / pow(heightInMeters, 2)
        resultLabel.text = String(format: "%.2f", result)
        
        var classificationMessage: String
        
        // Determinar la clasificación del IMC y la imagen correspondiente
        var imageName: String = ""  // Variable para almacenar el nombre de la imagen
        
        switch result {
        case ..<18.5:
            classificationMessage = "Según tus valores tu clasificación es: Bajo peso"
            imageName = selectedGender == "female" ? "female1" : "male1" // Imagen para bajo peso
        case 18.5..<25:
            classificationMessage = "Según tus valores tu clasificación es: Normal"
            imageName = selectedGender == "female" ? "female2" : "male2" // Imagen para peso normal
        case 25..<30:
            classificationMessage = "Según tus valores tu clasificación es: Sobrepeso"
            imageName = selectedGender == "female" ? "female3" : "male3" // Imagen para sobrepeso
        case 30..<35:
            classificationMessage = "Según tus valores tu clasificación es: Obesidad Clase I"
            imageName = selectedGender == "female" ? "female4" : "male4" // Imagen para obesidad clase I
        case 35..<40:
            classificationMessage = "Según tus valores tu clasificación es: Obesidad Clase II"
            imageName = selectedGender == "female" ? "female5" : "male5" // Imagen para obesidad clase II
        default:
            classificationMessage = "Según tus valores tu clasificación es: Obesidad Clase III"
            imageName = selectedGender == "female" ? "female6" : "male6" // Imagen para obesidad clase III
        }
        
        resultLabel2.text = "\(classificationMessage)"
        
        // Establecer la imagen correspondiente
        imgBody.image = UIImage(named: imageName)
    }
    
    @IBAction func closeInfo(_ sender: UIStoryboardSegue) {
        
    }
}
