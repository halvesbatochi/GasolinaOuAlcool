//
//  ViewController.swift
//  GasolinaOuAlcool
//
//  Created by Henrique Alves Batochi on 07/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultadoLegenda: UILabel!
    @IBOutlet weak var precoAlcool: UITextField!
    @IBOutlet weak var precoGasolina: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calcularCombustivel(_ sender: UIButton) {
        
        if let precoAlcool = precoAlcool.text {
            if let precoGasolina = precoGasolina.text {
                
                // Validar valores digitados
                let resultado = self.validarCampos(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                if resultado {
                    // Calcular melhor combustível
                    self.calcularMelhorPreco(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                } else {
                    resultadoLegenda.text = "Digite os preços para calcular!"
                }
            }
        }
    }
    
    func calcularMelhorPreco(precoAlcool: String, precoGasolina: String) {
        
        // Converte valores texto para numeros
        if let valorAlcool = Double(precoAlcool) {
            if let valorGasolina = Double(precoGasolina) {
                
                /* Faz cálculo (precoAlcool / precoGasolina)
                 * Se resultado >= 0.7 melhor utilizar a gasolina
                 * senão melhor utilizar o Álcool
                 **/
                let resultadoPreco = valorAlcool / valorGasolina
                if resultadoPreco >= 0.7 {
                    self.resultadoLegenda.text = "Melhor utilizar Gasolina!"
                } else {
                    self.resultadoLegenda.text = "Melhor utilizar Álcool!"
                }
            }
        }
        
    }
    
    func validarCampos(precoAlcool: String, precoGasolina: String) -> Bool {
        var camposValidados = true
        
        if precoAlcool.isEmpty || precoGasolina.isEmpty {
            camposValidados = false
        }
        
        return camposValidados
    }
    
}

