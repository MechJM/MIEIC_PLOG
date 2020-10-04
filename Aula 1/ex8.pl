cargo(tecnico, rogerio).  
cargo(tecnico, ivone).  
cargo(engenheiro, daniel).  
cargo(engenheiro, isabel).  
cargo(engenheiro, oscar).  
cargo(engenheiro, tomas).  
cargo(engenheiro, ana).  
cargo(supervisor, luis).  
cargo(supervisor_chefe, sonia).  
cargo(secretaria_exec, laura).  
cargo(diretor, santiago).  

chefiado_por(tecnico, engenheiro).  
chefiado_por(engenheiro, supervisor).  
chefiado_por(analista, supervisor).  
chefiado_por(supervisor, supervisor_chefe).  
chefiado_por(supervisor_chefe, director).  
chefiado_por(secretaria_exec, director).

/*
a) Que cargo(s) chefia um técnico e é também chefiado? engenheiro
b) A Ivone chefia técnicos? Y=tecnico,Z=rogerio
c) Quem são os supervisores? luis
d) Que cargos são chefiados por um supervisor ou um supervisor-chefe? engenheiro
e) Quem cargo(s) são chefiados pelo diretor e não pertencem à Carolina? supervisor_chefe
*/