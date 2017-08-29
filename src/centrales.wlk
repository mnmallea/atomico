object burns{
	var varillasDeUranio
	
	method varillasDeUranio(cuantasVarillas){
		varillasDeUranio = cuantasVarillas
	}
	
	method produccionEnergetica(unaCiudad){
		return 0.1 * varillasDeUranio
	}
	method esContaminante(){
		return varillasDeUranio > 20
	}
	
}

object exBosque{
	var capacidad
	
	method capacidad(nuevaCapacidad){
		capacidad = nuevaCapacidad
	}
	method produccionEnergetica(unaCiudad){
		return 0.5 + capacidad * unaCiudad.riquezaDelSuelo()
	}
	method esContaminante(){
		return true
	}
}

object elSuspiro{
	var turbinas = #{unaTurbina}
	
	method produccionEnergetica(unaCiudad){
		return turbinas.sum({unaTurbina => unaTurbina.produccionEnergetica(unaCiudad)})
	}
	method esContaminante(){
		return false
	}
}

object unaTurbina{
	method produccionEnergetica(unaCiudad){
		return 0.2 * unaCiudad.velocidadDelViento()
	}
}

object centralHidroelectrica{
	method produccionEnergetica(unaCiudad){
		return 2*unaCiudad.caudalRio()
	}
}