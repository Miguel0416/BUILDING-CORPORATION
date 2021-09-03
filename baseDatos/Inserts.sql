INSERT INTO rol (rol_id_rol, rol_tipo_rol, rol_created_at,rol_updated_at, rol_autEstado, rol_usuSesion)
VALUES (1, 'trabajador','02/09/2021 3:40', '02/09/2021 3:40', 1, ''),
       (2, 'empleador' ,'03/09/2021 3:41', '03/09/2021 3:41', 1,''),
       (3, 'auxiliar' ,'04/09/2021 3:42', '04/09/2021 3:42', 1,''),
       (4, 'empleado' ,'05/09/2021 3:43', '05/09/2021 3:43', 1,''),
       (5, 'asistente' ,'06/09/2021 3:44', '06/09/2021 3:44', 1,'');
       
INSERT INTO usuario_s (usuId, usuLogin, usuPassword, usuRemember_Token, usuEstado, usuario_updated_at, usu_created_at, usuUsuSesion)
VALUES (1, 'miguel', 'angel', '', 1, '02/09/2021 03:54', '02/09/2021 03:54', '' ),
       (2, 'joan', 'rua', '', 1, '02/09/2021 03:56', '02/09/2021 03:56', '' ),
       (3, 'juan', 'carlos', '', 1, '02/09/2021 03:58', '02/09/2021 3:58', '' ),
       (4, 'samir', 'susa', '', 1, '02/09/2021 00:04', '02/09/2021 00:04', '' ),
       (5, 'no', 'identificado', '', 1, '02/09/2021 04:01', '02/09/2021 04:01', '' );
INSERT INTO ubicacion (ubi_id, ubi_direccion, ubi_created_at, ubi_autEstado, ubi_updated_at, ubi_usuSesion)
VALUES (1, 'cll 184#22-16', '02/09/2021 04:21', 1, '02/09/2021 04:21', ''),
 (2, 'cll 189#2-24', '02/09/2021 04:21', 1, '02/09/2021 04:21', ''),
 (3, 'cll 187#3-26', '02/09/2021 04:22', 1, '02/09/2021 04:22', ''),
 (4, 'cll 188#4-28', '02/09/2021 04:23', 1, '02/09/2021 04:23', ''),
 (5, 'cll 180#5-22', '02/09/2021 04:24', 1, '02/09/2021 04:24', ''),
 (6, 'cll 170#6-20', '02/09/2021 04:25', 1, '02/09/2021 04:25', '');

INSERT INTO constructora (con_id, con_id_system_user, con_id_tipo_documento, con_estado, con_created_at, con_autEstado, con_nombre_empresa, connumero_documento, con_updated_at, con_usuSesion, usuario_s_usuId )
VALUES (1, 1, 1 'activo', '02/09/2021 04:30', 1, 'building corporation', '1000572910', '02/09/2021 04:33', '', 1 ),
(2, 2, 2, 'activo', '02/09/2021 04:34', 2, 'building', '1000572911', '02/09/2021 04:34', '', 2 ),
(3, 3, 3, 'activo', '02/09/2021 04:35', 3, 'corporation', '1000572912', '02/09/2021 04:35', '', 3 ),
(4, 4, 4, 'activo', '02/09/2021 04:36', 4, 'emprendimiento', '1000572913', '02/09/2021 04:33', '', 4 ),
(5, 5, 5, 'activo', '02/09/2021 04:37', 5, 'valor', '1000572914', '02/09/2021 04:37', '', 5 );


INSERT INTO sede (sed_id, sed_fecha_modificacion, sed_estado, sed_created_at, sed_constructora_id, sed_autEsado, sed_nombre_sede, sed_ubicacion_id, sed_updated_at, sed_usuSesion)
VALUES (1, '02/09/2021 04:06', 1, '02/09/2021 04:06', 1, 1, 'usaquen', 1, '02/09/2021 04:08', ''),
       (2, '02/09/2021 04:10', 1, '02/09/2021 04:10', 2, 1, 'bosa', 2, '02/09/2021 04:10', ''), 
       (3, '02/09/2021 04:15', 1, '02/09/2021 04:15', 3, 1, 'kenedy', 3, '02/09/2021 04:15', ''),
       (4, '02/09/2021 04:20', 1, '02/09/2021 04:20', 4, 1, 'usme', 4, '02/09/2021 04:20', ''),
       (5, '02/09/2021 04:25', 1, '02/09/2021 04:25', 5, 1, 'suba', 5, '02/09/2021 04:25', '');


INSERT INTO trabajador (tra_id, tra_primer_nombre, tra_segundo_nombre, tra_primer_apellido, tra_segundo_apellido,tra_estado, tra_sede_id, tra_tipo_documento_id,tra_created_at, tra_updated_at, tra_usuSesion, tra_autEstado)
VALUES (1, 'Juan', 'Carlos', 'Olmos', 'Villalobos', 'activo', 1, 1, '02/09/2021 05:33', '00/00/2021 04:33','',0),
       (2, 'Juan', 'Camilo', 'Olmos', 'Villalobos', 'activo', 1, 1, '02/07/2021 04:33', '00/00/2021 04:33','',0),
       (3, 'Jheferson', 'Carlos', 'Jurado', 'Torres', 'activo', 1, 1, '02/05/2021 07:33', '00/00/2021 04:33','',1),
       (4, 'Ronalt', 'Howell', 'Hughes', 'Kingdom', 'activo', 1, 1, '02/03/2021 03:33', '00/00/2021 04:33','',0),
       (5, 'Margarita', 'Ignacia', 'saieh', 'Jasir', 'activo', 1, 1, '02/02/2021 04:33', '00/00/2021 04:33','',0),


INSERT INTO material_construccion (mat_id, mat_nombre_material, mat_tipo_material, mat_precio, mat_created_at, mat_updated_at, mat_usuSesion)
    (1001,'Ladrillo','general', 1000, '02/09/2021 04:34', '03/09/2021 15:34',''),
    (2001,'cemento','pegante', 2500, '02/09/2021 12:34', '03/09/2021 21:34',''),
    (1003,'Eternit','cubierta', 32000, '11/09/2021 04:34', '03/09/2021 15:34',''),
    (1025,'Mosaicos','Ceramico', 11100, '04/09/2021 04:34', '03/09/2021 15:34',''),
    (5061,'Vinilo','Pintura', 56000, '02/06/2021 04:34', '03/09/2021 15:34',''),