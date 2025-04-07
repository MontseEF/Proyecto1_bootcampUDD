Algoritmo Calculadora_de_precios
	
	//Definimos variables//
	Definir nombreProducto, descuentoRespuesta, destino Como Cadena
	Definir precioProducto, precioProductoConIva, cantidad, envio, montoPagar, precioDescuentoCantidad, precioCupon, valorDescuento, pesoProducto Como Real
	Definir cuponDescuento Como Numerica
	
	//Definimos constantes//
	Definir descuentoCantidad, IVA Como Real
	descuentoCantidad <- 0.95
	IVA <- 1.12
	descuento_10 <- 0.90
	descuento_15 <- 0.85
	descuento_20 <- 0.80
	costoFijo_envio <- 10
	
	//Solicitar datos al usuario//
	Escribir "Ingrese el nombre del producto que desea:"
	Leer nombreProducto
	
	Escribir "Ingrese precio del producto: $"
	Leer precioProducto
	
	//Aplicar el cupon de descuento//
	Escribir "¿Usted cuenta con algún cupón de descuento? (s/n):"
	Leer descuentoRespuesta
	Si descuentoRespuesta = "s" Entonces
		Escribir "¿De cuánto es su cupón de descuento? 10 15 20:"
		Leer valorDescuento
		Segun valorDescuento Hacer
			10:
				precioCupon <- precioProducto * descuento_10
			15:
				precioCupon <- precioProducto * descuento_15
			20:
				precioCupon <- precioProducto * descuento_20
		Fin Segun
	FinSi
	
	//Aplicar Iva//
	Si descuentoRespuesta = "s" Entonces
		precioProductoConIva <- precioCupon * IVA
	SiNo 
		precioProductoConIva <- precioProducto * IVA
		
	FinSi
	
	//Datos asignados por el usuario//
	Escribir "Recuerde que por la compra de 2 productos iguales, se le aplica un 5% de descuento extra."
	Escribir "Ingrese cantidad a comprar:" 
	Leer cantidad
	
	//Aplicar 5% de descuento//
	Si cantidad = 2 Entonces
		precioDescuentoCantidad <- precioProductoConIva * descuentoCantidad  
	FinSi
	
	//Envio//
	Escribir "Ingrese el peso del paquete (kg):"
	Leer pesoProducto
	Escribir "Ingrese ciudad de destino:"
	Leer destino
	envio <- pesoProducto * cantidad + costoFijo_envio
	Escribir "Excelente, su destino ha sido seleccionado. Su costo de envio es: $", envio
	
	//Calcular monto final//
	Si cantidad = 1 Entonces
		montoPagar <- precioProductoConIva * cantidad + envio
	SiNo
		montoPagar<- precioDescuentoCantidad * cantidad + envio

	FinSi
	
	//mensaje final//
	
	Escribir "--------------------------------------------------------"
	Escribir "Su costo final a pagar es: $", montoPagar
	Escribir "Precio original: $", precioProducto
	Si descuentoRespuesta = "s" Entonces
		Escribir "Cupón de descuento: ", valorDescuento, "%"
		Escribir "Precio con cupón de descuento: $", precioCupon
	FinSi
	Escribir "IVA aplicado: 12%"
	Escribir "Precio con IVA: $", precioProductoConIva
	Escribir "Usted lleva: ", cantidad, " ", nombreProducto
	
	Si cantidad = 2 Entonces
		Escribir "Precio con descuento por cantidad: $", precioDescuentoCantidad
	FinSi
	
	Escribir "Peso paquete (kg): ", pesoProducto
	Escribir "Destino del envío: ", destino
	Escribir "El costo de envío: $", envio
	Escribir "------------------------------------------------------"
	Escribir "Gracias por su compra. Esperamos volver a saber de ti"
	
FinAlgoritmo
