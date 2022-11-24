
import { Controller } from 'stimulus'; 
export default class extends Controller {

  static targets = [ "order-one" ]

  connect() {
    console.log("hello from StimulusJS")
  }

  order(){
    console.log("ok")

  }


}

