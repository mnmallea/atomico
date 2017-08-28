object centralAtomica{
	var varillasDeUranio
	
	method varillasDeUranio(cuantasVarillas){
		varillasDeUranio = cuantasVarillas
	}
	
	method produccionEnergetica(unaCiudad){
		return 0.1 * varillasDeUranio
	}
	method contaminacion(){
		return varillasDeUranio > 20
	}
	
}

object centralDeCarbon{
	var capacidad
	
	method capacidad(nuevaCapacidad){
		capacidad = nuevaCapacidad
	}
	method produccionEnergetica(unaCiudad){
		return 0.5 + capacidad * unaCiudad.riquezaDelSuelo()
	}
	method contaminacion(){
		return true
	}
}

object centralEolica{
	var turbinas = #{turbina}
	
	method produccionEnergetica(unaCiudad){
		return turbinas.sum({unaTurbina => unaTurbina.produccionEnergetica(unaCiudad)})
	}
	method contaminacion(){
		return false
	}
}

object turbina{
	method produccionEnergetica(unaCiudad){
		return 0.2 * unaCiudad.velocidadDelViento()
	}
}

object centralHidroelectrica{
	method produccionEnergetica(unaCiudad){
		return 2*unaCiudad.caudalRio()
	}
}