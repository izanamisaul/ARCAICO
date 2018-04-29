#tabla de alumnos
create table Alumnos(
  idAlumno int not null auto_increment,
  Nombre varchar(45),
  Apaterno varchar(45),
  Amaterno varchar(45),
  Ndecontrol varchar(45),
  Curp varchar(45),
  Semestre int null,
  Sistemas_idSistema int not null,
  Carreras_idCarrera int not null,
  Status_idStatus int not null,
  primary key (idAlumno),
    foreign key (Sistemas_idSistema)
     references Sistemas (idSistema)
     on delete no action
     on update no action,
    foreign key (Carreras_idCarrera)
     references Carreras (idCarrera)
     on delete no action
     on update no action,
    foreign key (Status_idStatus)
     references Status (idStatus)
     on delete no action
     on update no action)
engine = InnoDB;
#tabla de el sistema (escolarizado, sabatino)
create table Sistemas(
  idSistema int not null auto_increment,
  Turno varchar(45), #se cambio Tipo por Turno
  primary key (idSistema)
)
engine = InnoDB;
#tabla de las carreras
create table Carreras(
  idCarrera int not null auto_increment,
  Nombre varchar(45),
  primary key (idCarrera)
)
engine = InnoDB;
#tabla de el estatus del alumno
create table Status(
  idStatus int not null auto_increment,
  Tipo varchar(45), #se cambio Turno por Tipo
  primary key (idStatus)
)
engine = InnoDB;
# tabla de el historial de actividades del alumno
create table Historialdeactividades(
  idHistorial int not null auto_increment,
  Desempeño varchar(50),
  Tutores_idTutor int not null,
  Congresos_idCongreso int not null,
  ActividadesComplementarias_idActividad int not null,
  Alumnos_idAlumno int not null,
  primary key (idHistorial),
    foreign key (Tutores_idTutor)
     references Tutores (idTutor)
     on delete no action
     on update no action,
    foreign key (Congresos_idCongreso)
     references Congresos (idCongreso)
     on delete no action
     on update no action,
    foreign key (ActividadesComplementarias_idActividad)
     references ActividadesComplementarias (idActividad)
     on delete no action
     on update no action,
    foreign key (Alumnos_idAlumno)
     references Alumnos (idAlumno)
     on delete no action
     on update no action
)
engine = InnoDB;
# tabla de los tutores que imparten dicha actividad
create table Tutores(
  idTutor int not null auto_increment,
  Nombre varchar(45),
  Apaterno varchar(45),
  Amaterno varchar(45),
  primary key (idTutor)
)
engine = InnoDB;
# tabla de las actividades complementarias
create table ActividadesComplementarias(
  idActividad int not null auto_increment,
  Nombre varchar(45),
  Cupo int null,
  Creditos int null,
  Observaciones varchar(50),
  primary key (idActividad) # se elimino costos y fechas de inicio y finalizacion en esta tabla
)
engine = InnoDB;
#tabla de los congresos
create table Congresos(
  idCongreso int not null auto_increment,
  Nombre varchar(45),
  Lugar varchar(45),
  Fechadeinicio datetime,
  Fechadefinalizacion datetime,
  Creditos int null, #se elimino Costos en esta tabla
  primary key (idCongreso)
)
engine = InnoDB;
#se elimino la tabla intermediaria entre actividades y alumnos
# se crea la tabla Periodo
#tabla Periodo
create table Periodo(
  idPeriodo int not null,
   primary key (idPeriodo)
)
engine = InnoDB;
# tabla de la bitacora
create table Bitacora_Complementarias(
  idBitacora int not null auto_increment,
  Movimiento varchar(20),
  ID int not null,
  Nombre varchar(45),
  Fecha varchar(45),
  Tabla varchar(45),
primary key(idBitacora)
)
engine = InnoDB;
# ------------ TRIGGERS ------------
#
#

# trigger de insertar de la tabla Alumno
create trigger Insertar_Alumnos after insert on Alumnos
for each row
insert into Bitacora_Complementarias(idBitacora, Movimiento, ID, Nombre, Fecha, Tabla) 
values(null, 'INSERT', new.idAlumno, user(), now(), 'Alumnos')
# trigger de modificar de la tabla Alumno
create trigger Modificar_Alumnos after update on Alumnos
for each row
insert into Bitacora_Complementarias(idBitacora, Movimiento, ID, Nombre, Fecha, Tabla) 
values(null, 'UPDATE', new.idAlumno, user(), now(), 'Alumnos')
# trigger de borrar de la tabla Alumno
create trigger Borrar_Alumnos after delete on Alumnos
for each row
insert into Bitacora_Complementarias(idBitacora, Movimiento, ID, Nombre, Fecha, Tabla) 
values(null, 'DELETE', old.idAlumno, user(), now(), 'Alumnos')

#trigger de insertar de la tabla de historial de actividades
create trigger Insertar_Historial after insert on Historialdeactividades
for each row
insert into Bitacora_Complementarias(idBitacora, Movimiento, ID, Nombre, Fecha, Tabla) 
values(null, 'INSERT', new.idHistorial, user(), now(), 'Historialdeactividades')
#trigger de modificar de la tabla de historial de actividades
create trigger Modificar_Historial after update on Historialdeactividades
for each row
insert into Bitacora_Complementarias(idBitacora, Movimiento, ID, Nombre, Fecha, Tabla) 
values(null, 'UPDATE', new.idHistorial, user(), now(), 'Historialdeactividades')
#trigger de eliminar de la tabla de historial de actividades
create trigger Borrar_Historial after delete on Historialdeactividades
for each row
insert into Bitacora_Complementarias(idBitacora, Movimiento, ID, Nombre, Fecha, Tabla) 
values(null, 'DELETE', old.idHistorial, user(), now(), 'Historialdeactividades')

#trigger de insertar de la tabla tutores
create trigger Insertar_Tutores after insert on Tutores
for each row
insert into Bitacora_Complementarias(idBitacora, Movimiento, ID, Nombre, Fecha, Tabla) 
values(null, 'INSERT', new.idTutor, user(), now(), 'Tutores')
#trigger de modificar de la tabla tutores
create trigger Modificar_Tutores after update on Tutores
for each row
insert into Bitacora_Complementarias(idBitacora, Movimiento, ID, Nombre, Fecha, Tabla) 
values(null, 'UPDATE', new.idTutor, user(), now(), 'Tutores')
#trigger de eliminar de la tabla tutores
create trigger Borrar_Tutores after delete on Tutores
for each row
insert into Bitacora_Complementarias(idBitacora, Movimiento, ID, Nombre, Fecha, Tabla) 
values(null, 'DELETE', old.idTutor, user(), now(), 'Tutores')

#trigger de insertar de la tabla de actividades complementarias
create trigger Insertar_Actividades after insert on ActividadesComplementarias
for each row
insert into Bitacora_Complementarias(idBitacora, Movimiento, ID, Nombre, Fecha, Tabla) 
values(null, 'INSERT', new.idActividad, user(), now(), 'ActividadesComplementarias')
#trigger de modificar de la tabla de actividades complementarias
create trigger Modificar_Actividades after update on ActividadesComplementarias
for each row
insert into Bitacora_Complementarias(idBitacora, Movimiento, ID, Nombre, Fecha, Tabla) 
values(null, 'UPDATE', new.idActividad, user(), now(), 'ActividadesComplementarias')
#trigger de eliminar de la tabla de actividades complementarias
create trigger Borrar_Actividades after delete on ActividadesComplementarias
for each row
insert into Bitacora_Complementarias(idBitacora, Movimiento, ID, Nombre, Fecha, Tabla) 
values(null, 'DELETE', old.idActividad, user(), now(), 'ActividadesComplementarias')

#trigger de insertar de la tabla de congresos
create trigger Insertar_Congresos after insert on Congresos
for each row
insert into Bitacora_Complementarias(idBitacora, Movimiento, ID, Nombre, Fecha, Tabla) 
values(null, 'INSERT', new.idCongreso, user(), now(), 'Congresos')
#trigger de modificar de la tabla de congresos
create trigger Modificar_Congresos after update on Congresos
for each row
insert into Bitacora_Complementarias(idBitacora, Movimiento, ID, Nombre, Fecha, Tabla) 
values(null, 'UPDATE', new.idCongreso, user(), now(), 'Congresos')
#trigger de eliminar de la tabla de congresos
create trigger Borrar_Congresos after delete on Congresos
for each row
insert into Bitacora_Complementarias(idBitacora, Movimiento, ID, Nombre, Fecha, Tabla) 
values(null, 'DELETE', old.idCongreso, user(), now(), 'Congresos')

