#02 de noviembre 2019
drop database if exists Achieveit;
create database Achieveit;
use Achieveit;

#---------------------------------------------------->C A T Á L O G O S<-----------------------------------------------------
create table Signo(
	idSigno int(10) primary key auto_increment,
    Val_Signo int(10), 
    Desc_Signo nvarchar(20)); 
    
create table Impacto(
	idImpacto int(10) primary key auto_increment,
    Desc_Impacto nvarchar(20)); 
    
create table Descripcion_Tiempo(
	idTDescrip int(10) primary key auto_increment,
    Desc_Tiempo nvarchar(35)); 
    
create table Tiempo(
	idTiempo int(10) primary key auto_increment,
    Val_Tiempo int(10),
    idTDescrip int(10),
    foreign key (idTDescrip) references Descripcion_Tiempo(idTDescrip)); 
    
#---------------------------------------------------->T A B L A S <-----------------------------------------------------
create table Cuenta_Usuario(
	idUsuario int(10) primary key auto_increment,
    Nombre nvarchar(60), 
    Contrasena nvarchar(32),
    Correo nvarchar(250),
    Cant_monedas int(20)); 
    
create table Objetivos(
	idObjetivo int(10) primary key auto_increment,
    Accion_Ob nvarchar(30), 
    Cant_Ob int(20),
    Desc_Ob nvarchar(60),
    idSigno int(10),
    idImpacto int(10),
    idTiempo int(10),
    idUsuario int(10),
    foreign key (idSigno) references Signo(idSigno),
    foreign key (idImpacto) references Impacto(idImpacto),
    foreign key (idTiempo) references Tiempo(idTiempo) on delete cascade on update cascade,
    foreign key (idUsuario) references Cuenta_Usuario(idUsuario) on delete cascade on update cascade);
    
create table Estrategias(
	idEstrategia int(10) primary key auto_increment,
    Accion_E nvarchar(30), 
    Cant_E int(20),
    Desc_E nvarchar(60),
    idSigno int(10),
    idObjetivo int(10),
    idTiempo int(10),
    foreign key (idObjetivo) references Objetivos(idObjetivo) on delete cascade on update cascade,
    foreign key (idSigno) references Signo(idSigno),
    foreign key (idTiempo) references Tiempo(idTiempo) on delete cascade on update cascade);
    
create table Actividades_Progreso(
	idA_P int(10) primary key auto_increment,
    Fecha_AP datetime, 
    Cant_AP int(20),
    Desc_AP nvarchar(60));
    
create table Relacion_Objetivos_Progreso(
	idObj_P int(10) primary key auto_increment,
    idA_P int(10),
    idObjetivo int(10),
    foreign key (idA_P) references Actividades_Progreso(idA_P) on delete cascade on update cascade,
    foreign key (idObjetivo) references Objetivos(idObjetivo) on delete cascade on update cascade);
    
create table Relacion_Estrategias_Actividades(
	idEstr_Ac int(10) primary key auto_increment,
    idA_P int(10),
    idEstrategia int(10),
    foreign key (idA_P) references Actividades_Progreso(idA_P) on delete cascade on update cascade,
    foreign key (idEstrategia) references Estrategias(idEstrategia) on delete cascade on update cascade);
    
#--------------------------------------->I N S E R C I Ó N  I N F O  C A T Á L O G O S<-------------------------------------
	insert into Signo(idSigno, Val_Signo, Desc_Signo) values (1, 0, 'Neutro');
    insert into Signo(idSigno, Val_Signo, Desc_Signo) values (2, 1, 'Positivo');
    insert into Signo(idSigno, Val_Signo, Desc_Signo) values (3, 2, 'Negativo');
    
	insert into Impacto(idImpacto, Desc_Impacto) values (1, 'Personal');
    insert into Impacto(idImpacto, Desc_Impacto) values (2, 'Familiar');
    insert into Impacto(idImpacto, Desc_Impacto) values (3, 'Laboral');
    
	insert into Descripcion_Tiempo(idTDescrip, Desc_Tiempo) values (1, 'año(s)');
    insert into Descripcion_Tiempo(idTDescrip, Desc_Tiempo) values (2, 'mes (meses)');
    insert into Descripcion_Tiempo(idTDescrip, Desc_Tiempo) values (3, 'semana(s)');
    insert into Descripcion_Tiempo(idTDescrip, Desc_Tiempo) values (4, 'dia(s)');
    insert into Descripcion_Tiempo(idTDescrip, Desc_Tiempo) values (5, 'dias a la semana');
