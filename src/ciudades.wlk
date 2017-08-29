import centrales.*

object regionAtomica{
	var ciudades = #{springfield,albuquerque}
	
	method centralesMasProductoras(){
		return ciudades.map({unaCiudad => unaCiudad.centralMasProductora()})
	}
}

object springfield{
	var velocidadDelViento = 10
	var riquezaDelSuelo = 0.9 
	var necesidadEnergetica
	var centrales =#{}
	
	method riquezaDelSuelo()=riquezaDelSuelo
	method velocidadDelViento() = velocidadDelViento
	method necesidadEnergetica(unaNecesidad){
		necesidadEnergetica=unaNecesidad
	}
	
	method agregarCentral(unaCentral){
		centrales.add(unaCentral)
	}
	method produccionEnergeticaTotal(){
		return centrales.sum({unaCentral => unaCentral.produccionEnergetica(self)})
	}
	method cubrioNecesidadesEnergeticas(){
		return self.produccionEnergeticaTotal() > necesidadEnergetica
	}
	method centralesContaminantes(){
		return centrales.filter({unaCentral=>unaCentral.esContaminante()})
	}
	method alHorno(){
		return self.todasCentralesContaminantes() || self.centralesContaminantesAportanMasQue(50)
	}
	method todasCentralesContaminantes(){
		return centrales.all({unaCentral=>unaCentral.esContaminante()})
	}
	method centralesContaminantesAportanMasQue(unPorcentaje){
		return self.produccionCentralesContaminantes() > necesidadEnergetica * unPorcentaje / 100
	}
	method produccionCentralesContaminantes(){
		return self.centralesContaminantes().sum({unaCentral => unaCentral.produccionEnergetica(self)})
	}
	method centralMasProductora(){
		return centrales.max({unaCentral => unaCentral.produccionEnergetica(self)})
	}
}

object albuquerque{
	var caudalRio=150
	var central = centralHidroelectrica
	
	method caudalRio() = caudalRio
	
	method centralMasProductora(){//como albuquerque tiene una unica central esta siempre sera la mas productiva
		return central
	}
}