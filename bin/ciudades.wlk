import centrales.*

object regionAtomica{
	var ciudades = #{springfield,albuquerque}
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
		return centrales.filter({unaCentral=>unaCentral.contaminacion()})
	}
	method alHorno(){
		return self.todasCentralesContaminantes() || self.centralesContaminantesAportanMasQue(50)
	}
	method todasCentralesContaminantes(){
		return centrales.all({unaCentral=>unaCentral.contaminacion()})
	}
	method centralesContaminantesAportanMasQue(unPorcentaje){
		return (self.centralesContaminantes().sum({unaCentral => unaCentral.produccionEnergetica(self)})> necesidadEnergetica * unPorcentaje / 100)
	}
}

object albuquerque{
	var caudalRio=150
	var central = centralHidroelectrica
	
	method caudalRio() = caudalRio
}