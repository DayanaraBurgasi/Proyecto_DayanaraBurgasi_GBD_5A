drop index RELATIONSHIP_5_FK;

drop index CLIENTE_PK;

drop table CLIENTE;

drop index RELATIONSHIP_14_FK;

drop index RELATIONSHIP_2_FK;

drop index ENCUESTA_PK;

drop table ENCUESTA;

drop index ENCUESTA_MEDIO2_FK;

drop index ENCUESTA_MEDIO_PK;

drop table ENCUESTA_MEDIO;

drop index ENCUESTA_PERSONAL2_FK;

drop index ENCUESTA_PERSONAL_PK;

drop table ENCUESTA_PERSONAL;

drop index ENCUESTA_POBLACION2_FK;

drop index ENCUESTA_POBLACION_PK;

drop table ENCUESTA_POBLACION;

drop index RELATIONSHIP_12_FK;

drop index RELATIONSHIP_13_FK;

drop index FACTURA_PK;

drop table FACTURA;

drop index GRUPO_POBLACION_PK;

drop table GRUPO_POBLACION;

drop index MEDIO_ENCUESTA_PK;

drop table MEDIO_ENCUESTA;

drop index RELATIONSHIP_1_FK;

drop index PERSONAL_PK;

drop table PERSONAL;

drop index RANGO_VALOR_ENCUESTA_PK;

drop table RANGO_VALOR_ENCUESTA;

drop index REGION_PK;

drop table REGION;

drop index RELATIONSHIP_6_FK;

drop index SUCURSAL_PK;

drop table SUCURSAL;

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   CLIENTE_ID           INT4                 not null,
   REGION_ID            INT4                 null,
   NOM_EMPRESA          CHAR(50)             not null,
   RUC_EMPRESA          NUMERIC(13)          not null,
   AREA                 CHAR(50)             null,
   DIRECCION_EMPRESA    VARCHAR(100)         null,
   constraint PK_CLIENTE primary key (CLIENTE_ID)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
CLIENTE_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on CLIENTE (
REGION_ID
);

/*==============================================================*/
/* Table: ENCUESTA                                              */
/*==============================================================*/
create table ENCUESTA (
   ENCUESTA_ID          INT4                 not null,
   CLIENTE_ID           INT4                 null,
   FACTURA_ID           INT4                 null,
   FECHA_INICIO         DATE                 not null,
   FECHA_FIN            DATE                 not null,
   RESULTADOS           VARCHAR(500)         not null,
   PROPOSITO_DESCP      VARCHAR(200)         not null,
   OBSERVACION_DESCP    VARCHAR(200)         not null,
   constraint PK_ENCUESTA primary key (ENCUESTA_ID)
);

/*==============================================================*/
/* Index: ENCUESTA_PK                                           */
/*==============================================================*/
create unique index ENCUESTA_PK on ENCUESTA (
ENCUESTA_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on ENCUESTA (
CLIENTE_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_14_FK on ENCUESTA (
FACTURA_ID
);

/*==============================================================*/
/* Table: ENCUESTA_MEDIO                                        */
/*==============================================================*/
create table ENCUESTA_MEDIO (
   ENCUESTA_ID          INT4                 not null,
   MEDIO_ENCUESTA_ID    INT4                 not null,
   constraint PK_ENCUESTA_MEDIO primary key (ENCUESTA_ID, MEDIO_ENCUESTA_ID)
);

/*==============================================================*/
/* Index: ENCUESTA_MEDIO_PK                                     */
/*==============================================================*/
create unique index ENCUESTA_MEDIO_PK on ENCUESTA_MEDIO (
ENCUESTA_ID,
MEDIO_ENCUESTA_ID
);

/*==============================================================*/
/* Index: ENCUESTA_MEDIO2_FK                                    */
/*==============================================================*/
create  index ENCUESTA_MEDIO2_FK on ENCUESTA_MEDIO (
MEDIO_ENCUESTA_ID
);

/*==============================================================*/
/* Table: ENCUESTA_PERSONAL                                     */
/*==============================================================*/
create table ENCUESTA_PERSONAL (
   PERSONAL_ID          INT4                 not null,
   ENCUESTA_ID          INT4                 not null,
   TIPO_PERSONAL        CHAR(100)            not null,
   constraint PK_ENCUESTA_PERSONAL primary key (PERSONAL_ID, ENCUESTA_ID)
);

/*==============================================================*/
/* Index: ENCUESTA_PERSONAL_PK                                  */
/*==============================================================*/
create unique index ENCUESTA_PERSONAL_PK on ENCUESTA_PERSONAL (
PERSONAL_ID,
ENCUESTA_ID
);

/*==============================================================*/
/* Index: ENCUESTA_PERSONAL2_FK                                 */
/*==============================================================*/
create  index ENCUESTA_PERSONAL2_FK on ENCUESTA_PERSONAL (
ENCUESTA_ID
);

/*==============================================================*/
/* Table: ENCUESTA_POBLACION                                    */
/*==============================================================*/
create table ENCUESTA_POBLACION (
   ENCUESTA_ID          INT4                 not null,
   POBLACION_ID         INT4                 not null,
   CANTIDAD_ENCUESTADOS INT4                 not null,
   constraint PK_ENCUESTA_POBLACION primary key (ENCUESTA_ID, POBLACION_ID)
);

/*==============================================================*/
/* Index: ENCUESTA_POBLACION_PK                                 */
/*==============================================================*/
create unique index ENCUESTA_POBLACION_PK on ENCUESTA_POBLACION (
ENCUESTA_ID,
POBLACION_ID
);

/*==============================================================*/
/* Index: ENCUESTA_POBLACION2_FK                                */
/*==============================================================*/
create  index ENCUESTA_POBLACION2_FK on ENCUESTA_POBLACION (
POBLACION_ID
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   FACTURA_ID           INT4                 not null,
   CLIENTE_ID           INT4                 null,
   RAN_ID               INT4                 null,
   FACTURA_NUM          VARCHAR(50)          not null,
   FACTURA_FECHA        DATE                 not null,
   FACTURA_SUBTOTAL     DECIMAL(10,2)        not null,
   FACTURA_IVA          DECIMAL(10,2)        not null,
   FACTURA_TOTAL        DECIMAL(10,2)        not null,
   constraint PK_FACTURA primary key (FACTURA_ID)
);

/*==============================================================*/
/* Index: FACTURA_PK                                            */
/*==============================================================*/
create unique index FACTURA_PK on FACTURA (
FACTURA_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_13_FK on FACTURA (
CLIENTE_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on FACTURA (
RAN_ID
);

/*==============================================================*/
/* Table: GRUPO_POBLACION                                       */
/*==============================================================*/
create table GRUPO_POBLACION (
   POBLACION_ID         INT4                 not null,
   POBLACION_NOMBRE     CHAR(300)            not null,
   constraint PK_GRUPO_POBLACION primary key (POBLACION_ID)
);

/*==============================================================*/
/* Index: GRUPO_POBLACION_PK                                    */
/*==============================================================*/
create unique index GRUPO_POBLACION_PK on GRUPO_POBLACION (
POBLACION_ID
);

/*==============================================================*/
/* Table: MEDIO_ENCUESTA                                        */
/*==============================================================*/
create table MEDIO_ENCUESTA (
   MEDIO_ENCUESTA_ID    INT4                 not null,
   MEDIO_ENCUESTA_NOM   CHAR(100)            not null,
   constraint PK_MEDIO_ENCUESTA primary key (MEDIO_ENCUESTA_ID)
);

/*==============================================================*/
/* Index: MEDIO_ENCUESTA_PK                                     */
/*==============================================================*/
create unique index MEDIO_ENCUESTA_PK on MEDIO_ENCUESTA (
MEDIO_ENCUESTA_ID
);

/*==============================================================*/
/* Table: PERSONAL                                              */
/*==============================================================*/
create table PERSONAL (
   PERSONAL_ID          INT4                 not null,
   SUCURSAL_ID          INT4                 null,
   PERS_CEDULA          NUMERIC(10)          not null,
   PERS_NOMBRE          CHAR(50)             not null,
   PERS_APELLIDO        CHAR(50)             not null,
   PERS_CORREO          CHAR(50)             null,
   PERS_TELF_DOM        NUMERIC(9)           null,
   PERS_TELF_MOV        NUMERIC(10)          null,
   PERS_FECHA_INGRESO   DATE                 not null,
   PERS_DIRECCION       CHAR(100)            null,
   PERS_AREA            CHAR(100)            not null,
   constraint PK_PERSONAL primary key (PERSONAL_ID)
);

/*==============================================================*/
/* Index: PERSONAL_PK                                           */
/*==============================================================*/
create unique index PERSONAL_PK on PERSONAL (
PERSONAL_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on PERSONAL (
SUCURSAL_ID
);

/*==============================================================*/
/* Table: RANGO_VALOR_ENCUESTA                                  */
/*==============================================================*/
create table RANGO_VALOR_ENCUESTA (
   RAN_ID               INT4                 not null,
   RAN_NOMBRE           CHAR(100)            not null,
   RAN_ENCUESTADOS_MAX  INT4                 not null,
   RAN_ENCUESTADOS_MIN  INT4                 not null,
   RAN_COSTO_ESTIMADO   DECIMAL(10,2)        not null,
   constraint PK_RANGO_VALOR_ENCUESTA primary key (RAN_ID)
);

/*==============================================================*/
/* Index: RANGO_VALOR_ENCUESTA_PK                               */
/*==============================================================*/
create unique index RANGO_VALOR_ENCUESTA_PK on RANGO_VALOR_ENCUESTA (
RAN_ID
);

/*==============================================================*/
/* Table: REGION                                                */
/*==============================================================*/
create table REGION (
   REGION_ID            INT4                 not null,
   REGION_NOMBRE        CHAR(50)             not null,
   constraint PK_REGION primary key (REGION_ID)
);

/*==============================================================*/
/* Index: REGION_PK                                             */
/*==============================================================*/
create unique index REGION_PK on REGION (
REGION_ID
);

/*==============================================================*/
/* Table: SUCURSAL                                              */
/*==============================================================*/
create table SUCURSAL (
   SUCURSAL_ID          INT4                 not null,
   REGION_ID            INT4                 not null,
   SUC_NOMBRE           CHAR(200)            not null,
   SUC_PROVINCIA        CHAR(50)             not null,
   SUC_CIUDAD           CHAR(50)             not null,
   SUC_DIRECCION        VARCHAR(100)         not null,
   constraint PK_SUCURSAL primary key (SUCURSAL_ID)
);

/*==============================================================*/
/* Index: SUCURSAL_PK                                           */
/*==============================================================*/
create unique index SUCURSAL_PK on SUCURSAL (
SUCURSAL_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on SUCURSAL (
REGION_ID
);

alter table CLIENTE
   add constraint FK_CLIENTE_RELATIONS_REGION foreign key (REGION_ID)
      references REGION (REGION_ID);

alter table ENCUESTA
   add constraint FK_ENCUESTA_RELATIONS_FACTURA foreign key (FACTURA_ID)
      references FACTURA (FACTURA_ID);

alter table ENCUESTA
   add constraint FK_ENCUESTA_RELATIONS_CLIENTE foreign key (CLIENTE_ID)
      references CLIENTE (CLIENTE_ID);

alter table ENCUESTA_MEDIO
   add constraint FK_ENCUESTA_ENCUESTA__ENCUESTA foreign key (ENCUESTA_ID)
      references ENCUESTA (ENCUESTA_ID);

alter table ENCUESTA_MEDIO
   add constraint FK_ENCUESTA_ENCUESTA__MEDIO_EN foreign key (MEDIO_ENCUESTA_ID)
      references MEDIO_ENCUESTA (MEDIO_ENCUESTA_ID);

alter table ENCUESTA_PERSONAL
   add constraint FK_ENCUESTA_ENCUESTA__PERSONAL foreign key (PERSONAL_ID)
      references PERSONAL (PERSONAL_ID);

alter table ENCUESTA_PERSONAL
   add constraint FK_ENCUESTA_ENCUESTA__ENCUESTA foreign key (ENCUESTA_ID)
      references ENCUESTA (ENCUESTA_ID);

alter table ENCUESTA_POBLACION
   add constraint FK_ENCUESTA_ENCUESTA__ENCUESTA foreign key (ENCUESTA_ID)
      references ENCUESTA (ENCUESTA_ID);

alter table ENCUESTA_POBLACION
   add constraint FK_ENCUESTA_ENCUESTA__GRUPO_PO foreign key (POBLACION_ID)
      references GRUPO_POBLACION (POBLACION_ID);

alter table FACTURA
   add constraint FK_FACTURA_RELATIONS_RANGO_VA foreign key (RAN_ID)
      references RANGO_VALOR_ENCUESTA (RAN_ID);

alter table FACTURA
   add constraint FK_FACTURA_RELATIONS_CLIENTE foreign key (CLIENTE_ID)
      references CLIENTE (CLIENTE_ID);

alter table PERSONAL
   add constraint FK_PERSONAL_RELATIONS_SUCURSAL foreign key (SUCURSAL_ID)
      references SUCURSAL (SUCURSAL_ID);

alter table SUCURSAL
   add constraint FK_SUCURSAL_RELATIONS_REGION foreign key (REGION_ID)
      references REGION (REGION_ID);
