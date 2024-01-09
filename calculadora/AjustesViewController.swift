//
//  AjustesViewController.swift
//  calculadora
//
//  Created by dam2 on 22/11/23.
//

import UIKit

class AjustesViewController: UIViewController {

    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn_vacio: UIButton!
    var botones: [(UIButton, Int)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

      botones = [
                (btn1, 1),
                (btn2, 2),
                (btn3, 3),
                (btn4, 4),
                (btn5, 5),
                (btn6, 6),
                (btn7, 7),
                (btn8, 8),
                (btn_vacio, 0)
            ]
        
    }
    
    
    var accesible = false
    
    func obtenerIndiceBotonVacio() -> Int? {
        if let indice = botones.firstIndex(where: { $0.0 == btn_vacio }) {
            return indice
        }
        return nil
    }
    
    @IBAction func pulsado1(_ sender: Any) {
        if let indiceBotonVacio = obtenerIndiceBotonVacio() {
            movimientoPosible(0, indiceBotonVacio)
            if accesible {
                mover(0, indiceBotonVacio)
            }
        }
        accesible = false
    }

    
    @IBAction func pulsado2(_ sender: Any) {
        if let indiceBotonVacio = obtenerIndiceBotonVacio() {
            movimientoPosible(1, indiceBotonVacio)
            if accesible {
                mover(1, indiceBotonVacio)
            }
        }
        accesible = false
    }
    
    @IBAction func pulsado3(_ sender: Any) {
        if let indiceBotonVacio = obtenerIndiceBotonVacio() {
            movimientoPosible(2, indiceBotonVacio)
            if accesible {
                mover(2, indiceBotonVacio)
            }
        }
        accesible = false
    }
    
    @IBAction func pulsado4(_ sender: Any) {
        if let indiceBotonVacio = obtenerIndiceBotonVacio() {
            movimientoPosible(3, indiceBotonVacio)
            if accesible {
                mover(3, indiceBotonVacio)
            }
        }
        accesible = false
    }
    
    @IBAction func pulsado5(_ sender: Any) {
        if let indiceBotonVacio = obtenerIndiceBotonVacio() {
            movimientoPosible(4, indiceBotonVacio)
            if accesible {
                mover(4, indiceBotonVacio)
            }
        }
        accesible = false
    }
    
    @IBAction func pulsado6(_ sender: Any) {
        if let indiceBotonVacio = obtenerIndiceBotonVacio() {
            movimientoPosible(5, indiceBotonVacio)
            if accesible {
                mover(5, indiceBotonVacio)
            }
        }
        accesible = false
    }
    
    @IBAction func pulsado7(_ sender: Any) {
        if let indiceBotonVacio = obtenerIndiceBotonVacio() {
            movimientoPosible(6, indiceBotonVacio)
            if accesible {
                mover(6, indiceBotonVacio)
            }
        }
        accesible = false
    }
    
    @IBAction func pulsado8(_ sender: Any) {
        if let indiceBotonVacio = obtenerIndiceBotonVacio() {
            movimientoPosible(7, indiceBotonVacio)
            if accesible {
                mover(7, indiceBotonVacio)
            }
        }
        accesible = false
    }


    func movimientoPosible(_ indiceBotonNumero: Int, _ indiceBotonVacio: Int) {
       
        if indiceBotonVacio == 0 {
            desbloquearBotones([1, 3])
        }
        
        if indiceBotonVacio == 1 {
            desbloquearBotones([0, 2, 4])
        }
        
        if indiceBotonVacio == 2 {
            desbloquearBotones([1, 5])
        }
        
        if indiceBotonVacio == 3 {
            desbloquearBotones([0, 4, 6])
        }
        
        if indiceBotonVacio == 4 {
            desbloquearBotones([3, 5, 1, 7])
        }
        
        if indiceBotonVacio == 5 {
            desbloquearBotones([2, 4, 8])
        }
        
        if indiceBotonVacio == 6 {
            desbloquearBotones([3, 7])
        }
        
        if indiceBotonVacio == 7 {
            desbloquearBotones([6, 8, 4])
        }
        
        if indiceBotonVacio == 8 {
            desbloquearBotones([5, 7])
        }

    }


    func desbloquearBotones(_ indices: [Int]) {
        accesible = true
        
    }
        
    func mover(_ indiceBotonNumero: Int, _ indiceBotonVacio: Int) {
        let tempValor = botones[indiceBotonNumero].1
        let tempColorFondoNumero = botones[indiceBotonNumero].0.backgroundColor
        let tempVacioValor = botones[indiceBotonVacio].1
        let tempColorFondoVacio = botones[indiceBotonVacio].0.backgroundColor
        botones[indiceBotonNumero].0.setTitle(String(tempVacioValor), for: .normal)
        botones[indiceBotonVacio].0.setTitle(String(tempValor), for: .normal)
        botones[indiceBotonNumero].1 = tempVacioValor
        botones[indiceBotonVacio].1 = tempValor
        botones[indiceBotonNumero].0.backgroundColor = tempColorFondoVacio
        botones[indiceBotonVacio].0.backgroundColor = tempColorFondoNumero
    }

}
