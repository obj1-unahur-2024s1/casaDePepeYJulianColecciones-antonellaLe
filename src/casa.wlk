import cosas.*

object casaDePepeYJulian {
	const cosas = [paqueteDeFideos, heladera, plancha, tiraDeAsado]
	
		method comprarCosas(cosa) {
			 cosas.add(cosa)
			 cuentaCorriente.extraer(cosa.precio()) //* Puede cambiar de cta */
			 }
		
		method cantidadDeCosasCompradas() = cosas.size()
		
		method tieneComida()= cosas.any({x => x.esComida()})
		
		method vieneDeEquiparse() {
			var valor = 0
			var ult = null
				valor = cosas.map({x => x.precio()}).last()
				ult = cosas.map({x => x.esElectrodomestico()}).last()
				return(valor >= 50000 or ult  )
		
		} 
		
		method esDerrochona(){ 
				return ( cosas.map({x => x.precio()}).sum() >= 90000)
				
		}
		
		method compraMasCara() = cosas.map({x => x.precio()}).max()
		
		method electrodomesticosComprados() = cosas.filter({x => x.esElectrodomestico()})
		
		method malaEpoca() = cosas.all({x => x.esComida()})
		
		method queFaltaComprar(lista) =	lista.filter({x => not cosas.contains(x)})
		
		
		method faltaComida() {
			var comida = []
			comida = cosas.filter({x => x.esComida()})
			return ( comida.size() < 2)
		}	
		
		method gastarEnCuenta(importe, tipoDeCta) = tipoDeCta.extraer(importe)
		
		method dineroDisponibleEn(cta) = cta.saldo()
		
}

// CUENTAS BANCARIAS //

object cuentaCorriente{
	var saldo = 0
	method depositar(importe){saldo += importe}
	
	method extraer(importe){saldo -=importe} 
				
	method saldo() = saldo
}

object cuentaGastos{
	var saldo = 0
	method depositar(importe){saldo = saldo + importe - 200}
	
	method extraer(importe){
			if (importe <= 10000) {saldo -= importe + 200} 
				else saldo -= importe + (importe * 0.02)} 
				 
	method saldo() = saldo
}

object cuentaCombinada{
	var ctaPrimaria = 0
	var ctaSecundaria = 0
	
		method depositar(importe){ctaPrimaria += importe}
	
		method extraer(importe){
			if (importe >= ctaPrimaria){ ctaPrimaria -= importe}
				else ctaSecundaria -= importe
} 
				
		method saldo() = ctaPrimaria + ctaSecundaria
	
	
}
