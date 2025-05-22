class ProfesionalVinculado {
  var universidad

  method universidad() = [universidad]

  method honorarios() = universidad.honorarios()

  method provincia() = [universidad.provincia()]

  method cobrarImporte(importe) {
    universidad.recibirDonacion(importe/2)
  }
}

class ProfesionalDelLitoral {
  var universidad
    
  method universidad() = [universidad]

  method honorarios() = 3000

  method provincia() = [entreRios, santaFe , corrientes]

  method cobrarImporte(importe) {
    asociacionProfesionalesDelLitoral.recibirDonacion(importe)
  }
}

class ProfesionalLibre {

  var universidad
  var honorarios
  var provincias
  var totalRecaudado = 0

  method totalRecaudado() = totalRecaudado

  method universidad() = [universidad]

  method honorarios() = honorarios

  method provincia() = provincias

  method agregarPronvincia(unaProvincia) {
    provincias.add(unaProvincia)
  }

  method cobrarImporte(importe) {
    totalRecaudado = totalRecaudado + importe
  }

  method pasarDinero(cantidad , persona) {
    if (cantidad <= totalRecaudado) {
      persona.cobrarImporte(cantidad)
      totalRecaudado = totalRecaudado - cantidad
    }
  }
}

class Universidad {

  var provincia
  var honorarios
  var donaciones = 0

  method donacion() = donaciones

  method honorarios() = honorarios

  method provincia() = provincia

  method recibirDonacion(importe) {
    donaciones = donaciones + importe
  }
}

class Empresa {

  var honorarios
  const empleados = []
  const clientes = []

  method empleados() = empleados

  method contratarEmpleado(empleado) {
    empleados.add(empleado)
  }

  method empleadosqueEstudiaronEnUnaUniversidad(universidad) {
    return
      empleados.filter({e=>e.universidad() == [universidad]}).size()
  }

  method profesionalesCaros() {
    return
      empleados.filter({e=>e.honorarios() > honorarios}).asSet()
  }

  method universidadesFormadoras() {
    return
      empleados.map({e=>e.universidad()}).flatten().asSet()
  }

  method empleadoMasBarato() {
    return
      empleados.min({e=>e.honorarios()})
  }

  method esGenteAcotada() {
    return
      empleados.all({e=>e.provincia().size()<=3})
  }

  method puedeSatisfacerAlSolicitante(solicitante) {
    return
      empleados.any({e=>solicitante.puedeSerAtendidoPorEmpleado(e)})
  }

  method empleadoAptoParaSolicitante(solicitante) {
    return
      empleados.find({e=>solicitante.puedeSerAtendidoPorEmpleado(e)})
  }

  method darServicio(solicitante) {
    if(self.puedeSatisfacerAlSolicitante(solicitante)) {
      self.empleadoAptoParaSolicitante(solicitante).cobrarImporte(self.empleadoAptoParaSolicitante(solicitante).honorarios())
      clientes.add(solicitante)
    }
  }

  method cuantosClientesTiene() {
    return
      clientes.size()
  }

  method seEncuentraElCliente(cliente) {
    return
      clientes.contains(cliente)
  }
}

object asociacionProfesionalesDelLitoral {
  
  var donacion = 0

  method donacion() = donacion

  method recibirDonacion(importe) {
    donacion = donacion + importe
  }
}

object bsAs {}

object santaFe {}

object corrientes {}

object entreRios {}

object cordoba {}

object jujuy {}

object salta{}


