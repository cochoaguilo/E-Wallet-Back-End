const jwt = require('jsonwebtoken');





const autentificarUser = (req,res,next) =>{
    
    const jwtToken = req.headers["authorization"];
    if (!jwtToken) {
        return res.status(401).json({ message: "Unauthorized" });
    }
    let clave = "marcos21";
    const jwtClient = jwtToken.split(" ")[1];
    jwt.verify(jwtClient, clave, (error, decoded) => {
        
        if (error) {
            console.log(error);
            return res.status(401).json({ message: "Token Expired" });
        }
        
        if (decoded) {
            
            next();
        }else{
            return res.status(401).json({message: 'usuario no permitido'})
        }
    });
}


  exports.autentificarUser = autentificarUser;
