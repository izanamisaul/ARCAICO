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

create table Sistemas(
  idSistema int not null auto_increment,
  Tipo varchar(45),
  primary key (idSistema)
)
engine = InnoDB;

create table Carreras(
  idCarrera int not null auto_increment,
  Nombre varchar(45),
  primary key (idCarrera)
)
engine = InnoDB;

create table Status(
  idStatus int not null auto_increment,
  Turno varchar(45),
  primary key (idStatus)
)
engine = InnoDB;

create table Historialdeactividades(
  idHistorial int not null auto_increment,
  Desempeño varchar(50),
  Tutores_idTutor int not null,
  Congresos_idCongreso int not null,
  ActividadesComplementarias_idActividad int not null,
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
     on update no action
)
engine = InnoDB;

create table Tutores(
  idTutor int not null auto_increment,
  Nombre varchar(45),
  Apaterno varchar(45),
  Amaterno varchar(45),
  primary key (idTutor)
)
engine = InnoDB;

create table ActividadesComplementarias(
  idActividad int not null auto_increment,
  Nombre varchar(45),
  Fechadeinicio datetime,
  Fechadefinalizacion datetime,
  Cupo int null,
  Creditos int null,
  Observaciones varchar(50),
  Costo int null,
  primary key (idActividad)
)
engine = InnoDB;

create table Congresos(
  idCongreso int not null auto_increment,
  Nombre varchar(45),
  Lugar varchar(45),
  Fechadeinicio datetime,
  Fechadefinalizacion datetime,
  Creditos int null,
  Costo int null,
  primary key (idCongreso)
)
engine = InnoDB;

create table Alumnos_has_Historialdeactividades(
  Alumnos_idAlumno int not null,
  Historialdeactividades_idHistorial int not null,
  primary key (Alumnos_idAlumno, Historialdeactividades_idHistorial),
   foreign key (Alumnos_idAlumno)
    references Alumnos (idAlumno)
    on delete no action
    on update no action,
   foreign key (Historialdeactividades_idHistorial)
    references historialdeactividades (idHistorial)
    on delete no action
    on update no action 
)
engine = InnoDB;

select * from Alumnos_has_Historialdeactividades