const sequelize = require('../conexion');


const getOperations =  async (req, res) => {
    //let idUser = req.params.id;
    const query = `SELECT o.*, t.name FROM
                  operation o 
                  LEFT JOIN tipo t using(id_tipo)
                  where id_usuario = ${req.params.id}`;
    try {
      
      const u = await sequelize.query(query, {type:sequelize.QueryTypes.SELECT});
      res.json(u);
    } catch(e) {
      console.log(e);
    }
  };

const newOperation =   async(req, res) => {
  
    try {
      
      const {concept, amount, date, tipo} = req.body;

      let queryUser = `INSERT into operation(concept, amount, date, id_usuario, id_tipo)
                        VALUES(?,?,?,?,?)`


      const queryTipo = 
      `SELECT id_tipo                       
      FROM tipo
      WHERE name = '${tipo}'`;
        let Tipo = await sequelize.query(queryTipo, {type:sequelize.QueryTypes.SELECT})

      

      sequelize.query(queryUser, {
        replacements: [
          concept, amount, date, req.params.id, Tipo[0].id_tipo
        ]
      }).then((response)=>{
        res.send({mensaje: 'send', operation: req.body});
      })
    } catch(e) {
      console.log(e);
    }
};
const deleteOperation = async (req,res)=>{
    
    const query = 'DELETE FROM operation WHERE id_operation= ?';
    try{
    sequelize.query(query, {
      replacements:[req.params.id]
    }).then((data => {
      res.send({status: 'eliminated'});
    }))}
    catch(e){
      res.status(400);
      console.log(e)
    }
};

const updateOperation = async (req, res) =>{
  
  
  try {
    
    const {concept, amount, date} = req.body;

      await sequelize.query(`UPDATE  operation
      SET concept = "${concept}",
      amount = "${amount}",
      date = "${date}"
      WHERE id_operartion = ${req.params.id}`,
      { type: sequelize.QueryTypes.INSERT })
      .then((data =>{

        res.status(201).json({
          message: 'operation updated',
          data:req.body
      })
      })
      
      )

  } catch (error) {
      console.log(`error en la inserción ${error}`)
  }
}  


module.exports = {
  getOperations,
  newOperation,
  deleteOperation,
  updateOperation
} 
