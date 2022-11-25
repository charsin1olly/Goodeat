
import { Controller } from 'stimulus'; 

export default class extends Controller {
  static targets = ["quantity"];

  connect() {
    console.log("quantity")
    this.max = +this.quantityTarget.max;
    this.min = +this.quantityTarget.min;
  }



  plus(e){
    e.preventDefault()
    console.log("+")
    // const q = + this.quantityTarget.value
    // console.log(q)
    // quantityTarget.value
  }

  minus(e){
    e.preventDefault()
    console.log("-")
  }




}

