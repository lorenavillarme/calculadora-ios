//
//  CalculadoraViewController.swift
//  calculadora
//
//  Created by dam2 on 22/11/23.
//

import UIKit

class CalculadoraViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   
    var total :Double = 0.0
    var numEntrante:Double = 0.0
    var operating = false
    var operation: OperationType = .none
    var cambio = false
    var esDecimal = false
    var memoria = 0.0
    //var operaciones = 0
    //var mostrar = false

    enum OperationType {
     case none
     case suma
     case resta
     case mult
     case div
     case porcentaje
    }
    
    @IBOutlet weak var pantalla: UITextView!
    
    
    @IBAction func btn_c(_ sender: Any) {
        pantalla.text = ""
        total = 0
        numEntrante = 0
        operating = false
        operation = .none
    }

    @IBAction func sum_memoria(_ sender: Any) {
        memoria += total
    }
    
    
    @IBAction func res_memoria(_ sender: Any) {
        memoria -= total
    }
    
    @IBAction func borra_memoria(_ sender: Any) {
        memoria = 0.0
    }
    
    @IBAction func memoria_a_pantalla(_ sender: Any) {
        pantalla.text = ""
        pantalla.text = String(memoria)
    }
    
    
    
    @IBAction func btn_negativo(_ sender: Any) {
        if total == 0 {
            pantalla.text += "-"
            cambio = true
        }else {
            if numEntrante == 0 {
                pantalla.text += "-"
                cambio = true
            }
        }
    }
    
    
    @IBAction func btn_porcentaje(_ sender: Any) {
        pantalla.text += "%"
        operating = true
        operation = .porcentaje
    }
    
    @IBAction func btn_div(_ sender: Any) {
        pantalla.text += "/"
        operating = true
        operation = .div
    }
    
    @IBAction func btn_mult(_ sender: Any) {
        pantalla.text += "*"
        operating = true
        operation = .mult
    }
    
    @IBAction func btn_resta(_ sender: Any) {
        pantalla.text += "-"
        operating = true
        operation = .resta
    }
    
    @IBAction func btn_suma(_ sender: Any) {
        pantalla.text += "+"
        operating = true
        operation = .suma
    }
    
    @IBAction func btn_coma(_ sender: Any) {
        pantalla.text += "."
        esDecimal = true
    }
    
    
    func btnNumero(_ numero: Int) {
        if operating {
            if esDecimal {
                if numEntrante < 0 {
                    numEntrante = numEntrante * 10 - (Double(numero) * 0.1 )
                }else {
                    numEntrante = numEntrante * 10 + (Double(numero) * 0.1)
                    if cambio {
                        numEntrante = numEntrante * -1
                        cambio = false
                    }
                }
            }else {
                if numEntrante < 0 {
                    numEntrante = numEntrante * 10 - Double(numero)
                }else {
                    numEntrante = numEntrante * 10 + Double(numero)
                    if cambio {
                        numEntrante = numEntrante * -1
                        cambio = false
                    }
                }
            }
        }else {
            if esDecimal {
                if total < 0 {
                    total = total * 10 - (Double(numero) * 0.1 )
                }else {
                    total = total * 10 + (Double(numero) * 0.1)
                    if cambio {
                        total = total * -1
                        cambio = false
                    }
                }
            }else {
                if total < 0 {
                    total = total * 10 - Double(numero)
                }else {
                    total = total * 10 + Double(numero)
                    if cambio {
                        total = total * -1
                        cambio = false
                    }
                }
            }
          
        }
    }
    
    @IBAction func btn0(_ sender: Any) {
        btnNumero(0)
        pantalla.text += "0"
    }
    
    @IBAction func btn1(_ sender: Any) {
        btnNumero(1)
        pantalla.text += "1"
    }

    @IBAction func btn2(_ sender: Any) {
        btnNumero(2)
        pantalla.text += "2"
    }
    
    @IBAction func btn3(_ sender: Any) {
        btnNumero(3)
        pantalla.text += "3"
    }
    
    @IBAction func btn4(_ sender: Any) {
        btnNumero(4)
        pantalla.text += "4"
    }
    
    @IBAction func btn5(_ sender: Any) {
        btnNumero(5)
        pantalla.text += "5"
    }
    
    @IBAction func btn6(_ sender: Any) {
        btnNumero(6)
        pantalla.text += "6"
    }
    
    @IBAction func btn7(_ sender: Any) {
        btnNumero(7)
        pantalla.text += "7"
    }
    
    @IBAction func btn8(_ sender: Any) {
        btnNumero(8)
        pantalla.text += "8"
    }
    
    @IBAction func btn9(_ sender: Any) {
        btnNumero(9)
        pantalla.text += "9"
    }
    

    
    @IBAction func btn_igual(_ sender: Any) {
        accionIgual()
       
    
}

    func accionIgual(){
        switch operation {
        case .none:
          break

        case .suma:
          total += numEntrante

          break

        case .resta:
          total -= numEntrante
          break

        case .mult:
          total *= numEntrante
          break

        case .div:
          total /= numEntrante
          break

        case .porcentaje:
          total = total * numEntrante / 100
          break
        }
        
            pantalla.text = String(total)
       
      }
   
    }
