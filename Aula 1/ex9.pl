aluno(joao, paradigmas). 
aluno(maria, paradigmas).  
aluno(joel, lab2). 
aluno(joel, estruturas).  
frequenta(joao, feup). 
frequenta(maria, feup).  
frequenta(joel, ist).
professor(carlos, paradigmas).
professor(ana_paula, estruturas).  
professor(pedro, lab2). 
funcionario(pedro, ist). 
funcionario(ana_paula, feup).  
funcionario(carlos, feup).

aluno_do_professor(Aluno,Professor) :-
    professor(Professor,Disciplina),
    aluno(Aluno,Disciplina).

pessoa_da_universidade(Pessoa,Universidade) :-
    frequenta(Pessoa,Universidade);
    funcionario(Pessoa,Universidade).

colega(Pessoa1,Pessoa2) :-
(
    (
        professor(Pessoa1,_),
        professor(Pessoa2,_),
        funcionario(Pessoa1,Faculdade),
        funcionario(Pessoa2,Faculdade)
    );
    (
        (
            frequenta(Pessoa1,Faculdade),
            frequenta(Pessoa2,Faculdade)
        );
        (
            aluno(Pessoa1,Disciplina),
            aluno(Pessoa2,Disciplina)
        )
        /* Como ver se são do mesmo curso?
        (

        )*/
    )
),
    Pessoa1 \== Pessoa2.

/* Queries
a) aluno_do_professor(Aluno,X).
b) pessoa_da_universidade(Pessoa,X).
c) colega(Pessoa1,Pessoa2).
*/