const sequelize = require('../conexion');
let jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const saltRounds = 10;

const newUser =   async(req, res) => {
  
    try {
      console.log(req.body);
      const {name,  surname, email, password } = req.body;
      
      const query = 
      `INSERT INTO usuarios (name,  
        surname, email, password) 
      VALUES (?,?,?,?)`;

      const hashedPassword = await bcrypt.hash(password,saltRounds);
      sequelize.query(query, {
        replacements: [
          name, surname, email, hashedPassword
        ]
      }).then((response)=>{
        
        res.send({mensaje: 'sent', user: req.body});
      })
    } catch(e) {
      console.log(e);
    }
};

const loginUser = async(req, res) => {
    let clave = "marcos21";
    const { email, password } = req.body;
    
    try{
      const query = `SELECT * FROM usuarios
    WHERE email = ? LIMIT 1`;
      let result = await sequelize.query(query,{replacements:[email],
        type:sequelize.QueryTypes.SELECT
      });
      
      if(result.length ==0){
        res.send("usuario incorrecto");
        
      }
      if (result.length == 1) {
       // console.log(result[0].id_perfil);
        let token = jwt.sign({correo: result[0].correo}, clave);
       
        if (await bcrypt.compare(password, result[0].password)) {
          res.status(200).json({msj: 'usuario logged in', token: token, id:result[0].id_usuario});
        }else{
          res.status(404).json({msj: 'contraseña incorrecta'});
        }
      } 
      
      }
    catch (e){
      console.log(e);
    }
  };

  exports.newUser = newUser;
  exports.loginUser = loginUser;