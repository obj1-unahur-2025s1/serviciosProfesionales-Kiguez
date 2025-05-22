class PersonaSolicitante {
    var provincia

    method provincia() = [provincia]

    method puedeSerAtendidoPorEmpleado(empleado) {
        return
            empleado.provincia().contains(provincia)
    }
}

class ClubSolicitante {

    var provincias 

    method provincias() = provincias

    method puedeSerAtendidoPorEmpleado(empleado) {
        return
            empleado.provincia().asSet().intersection(provincias.asSet()).size() >= 1
    }
}

class InstitucionSolicitante {

    var universidades

    method universidades() = universidades

    method puedeSerAtendidoPorEmpleado(empleado) {
        return
            empleado.universidad().asSet().intersection(universidades.asSet()).size() >= 1
    }
}