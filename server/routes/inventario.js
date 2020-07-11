/*
 * @file inventario.js
 *
 * @brief Rutas de inventario 
 *
 * @author Josué Gutiérrez Quino <josuandroidg7@gmail.com>
 *
*/

const express = require( 'express' );
const app = express();

const { Pool } = require('pg');
const pool = new Pool({
    user: 'josue',
    host: 'localhost',              // Para pruebas.
    database: 'yagbohemian',
    password: 'a',
    port: 5432,
});

pool.connect( err => {
    if ( err ) {
        throw err.stack;
    }
});

// + OBTENER LOS PRODUCTOS
app.get( '/bohemian/productos/obtener', async ( req, res ) => {
    pool.query( 
        'select * from inventario.obtenerProductos()', 
        (error, respuesta) => {
          if ( error ) {
              res.json( {
                  'status' : 'nok',
                  'message' : error.message
              });
              return;      
          }
          res.send( JSON.parse( respuesta.rows[0]['obtenerproductos'] ) );
        });
})


module.exports = app;